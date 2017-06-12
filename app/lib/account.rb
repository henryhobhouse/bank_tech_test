require 'date'

# Object class for each account belonging to the bank.
class Account
  attr_reader :account_number, :balance, :history

  def initialize(account_number)
    @account_number = account_number
    @balance = 0
    @history = []
    @overdraft_allowance = 0
  end

  def deposit(credit)
    @balance += credit
    record(credit, nil)
  end

  def withdrawal(debit)
    raise 'Insufficent Funds' if @balance - debit < @overdraft_allowance
    @balance -= debit
    record(nil, debit)
  end

  private

  def record(credit, debit)
    @history.push(datetime: DateTime.now,
                  credit: credit,
                  debit: debit,
                  balance: @balance)
  end
end
