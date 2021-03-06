require 'date'
require_relative 'transactions'

# Resonsible for balance and manipulating it from recieving deposits and credits
class Account
  attr_reader :account_number, :balance, :transactions

  def initialize(account_number)
    @account_number = account_number
    @balance = 0
    @transactions = Transactions.new
    @overdraft_allowance = 0
  end

  def deposit(credit)
    @balance += credit
    @transactions.record('credit', credit, balance)
  end

  def withdrawal(debit)
    @balance -= debit
    @transactions.record('debit', debit, balance)
  end
end
