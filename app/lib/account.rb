require 'date'

# Object class for each account belonging to the bank.
class Account
  attr_reader :account_number, :balance, :transactions

  def initialize(account_number)
    @account_number = account_number
    @balance = 0
    @transactions = []
    @overdraft_allowance = 0
  end

  def deposit(credit)
    @balance += credit
    record('credit', credit)
  end

  def withdrawal(debit)
    @balance -= debit
    record('debit', debit)
  end

  private

  def record(type, value)
    @transactions.push( datetime: DateTime.now,
                        type: type,
                        value: value,
                        balance: @balance)
  end
end
