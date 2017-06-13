describe Interface do
  before(:all) do
    @interface = Interface.new
    @interface.bank.new_account
  end

  context 'creating accounts' do
    it 'Interface can create a new account' do
      expect(@interface.bank.accounts.count).to eq 1
    end
  end

  context 'updating specific accounts' do
    before(:all) do
      @interface.deposit(11_111_111, 100)
      test_time = Time.local(2008, 9, 1, 12, 0, 0)
      Timecop.freeze(test_time)
    end

    it 'Interface can deposit into an specific account' do
      expect(@interface.bank.accounts[0].balance).to eq 100
    end

    it 'Interface can withdrawal into an specific account' do
      @interface.withdrawal(11_111_111, 70)
      expect(@interface.bank.accounts[0].balance).to eq 30
    end

    it 'Interface can create statement for specific account' do
      expect { @interface.statement(11_111_111) }.to output(+
      "date || credit || debit || balance\n" \
      "13/06/2017 || 100.00 ||  || 100.00\n" \
      "01/09/2008 ||  || 70.00 || 30.00\n").to_stdout
    end

    after(:all) do
      Timecop.return
    end
  end
end
