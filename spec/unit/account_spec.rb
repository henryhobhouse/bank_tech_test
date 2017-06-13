describe Account do
  let(:account) { described_class.new(11_111_111) }

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
  end
end
