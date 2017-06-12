require 'date'

# Object class for each account belonging to the bank.
class Account
  attr_reader :account_number, :balance, :history, :overdraft

  def initialize(account_number)
    @account_number = account_number
    @balance = 0
    @history = []
    @overdraft = 0
    record(:open, 0)
  end

  def deposit(value)
    @balance += value
    record(:deposit, value)
  end

  def record(type, value)
    @history.push(datetime: DateTime.now,
                  type: type,
                  amount: value,
                  balance: @balance)
  end

  def withdrawal(value)
    raise "Insufficent Funds" if @balance - value < @overdraft
    @balance -= value
    record(:withdrawal, value)
  end
end
