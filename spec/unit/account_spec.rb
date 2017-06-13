describe Account do
  let(:account) { described_class.new(11_111_111) }

  before(:all) do
    test_time = Time.local(2008, 9, 1, 12, 0, 0)
    Timecop.freeze(test_time)
  end

  context 'account initiliazation' do
    it 'new account can have account number assigned to it' do
      expect(account.account_number).to eq 11_111_111
    end

    it 'new accounts will have a balance of zero' do
      expect(account.balance).to eq 0
    end
  end

  context 'updating balance' do
    it 'account can have deposit added to balance' do
      account.deposit(100)
      expect(account.balance).to eq 100
    end

    it 'account can process withdrawal' do
      account.deposit(100)
      account.withdrawal(50)
      expect(account.balance).to eq 50
    end

    it 'account balance cannot go below overdraft allowance' do
      expect { account.withdrawal(50) }.to raise_error('Insufficent Funds')
    end
  end

  context 'recording history' do
    it 'account records deposit date and time' do
      account.deposit(100)
      expect(account.history[0][:credit]).to eq 100
      expect(account.history[0][:datetime].strftime('%I:%M:%S')).to eq '12:00:00'
    end

    it 'account records withdrawal date and time' do
      account.deposit(100)
      account.withdrawal(50)
      expect(account.history[1][:debit]).to eq 50
      expect(account.history[1][:datetime].strftime('%I:%M:%S')).to eq '12:00:00'
    end

    after(:all) do
      Timecop.return
    end
  end
end
