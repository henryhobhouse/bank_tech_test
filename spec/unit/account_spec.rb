describe Account do
  before(:each) do
    test_time = Time.local(2008, 9, 1, 12, 0, 0)
    Timecop.freeze(test_time)
    @test_account = Account.new(11_111_111)
  end

  context 'account initiliazation' do
    it 'new account can have account number assigned to it' do
      expect(@test_account.account_number).to eq 11_111_111
    end

    it 'new accounts will have a balance of zero' do
      expect(@test_account.balance).to eq 0
    end
  end

  context 'updating balance' do
    it 'account can have deposit added to balance' do
      @test_account.deposit(100)
      expect(@test_account.balance).to eq 100
    end

    it 'account can process withdrawal' do
      @test_account.deposit(100)
      @test_account.withdrawal(50)
      expect(@test_account.balance).to eq 50
    end
  end

  context 'recording history' do
    it 'account records open date and time' do
      expect(@test_account.history[0][:datetime].strftime('%I:%M:%S')).to eq '12:00:00'
    end

    it 'account records deposit date and time' do
      @test_account.deposit(100)
      expect(@test_account.history[1][:type]).to eq :deposit
      expect(@test_account.history[1][:datetime].strftime('%I:%M:%S')).to eq '12:00:00'
    end

    it 'account records withdrawal date and time' do
      @test_account.deposit(100)
      @test_account.withdrawal(50)
      expect(@test_account.history[2][:type]).to eq :withdrawal
      expect(@test_account.history[2][:datetime].strftime('%I:%M:%S')).to eq '12:00:00'
    end

    after(:each) do
      Timecop.return
    end
  end
end
