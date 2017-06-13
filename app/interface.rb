require './app/lib/bank.rb'
require './app/lib/statement_printer.rb'

# Responsible for interfacing between the user and the app
class Interface
  attr_reader :bank

  def initialize
    @bank = Bank.new
  end

  def new_account
    @bank.new_account
  end

  def deposit(account_number, value)
    account = @bank.get_account(account_number)
    account.deposit(value)
  end

  def withdrawal(account_number, value)
    account = @bank.get_account(account_number)
    account.withdrawal(value)
  end

  def statement(account_number)
    account = @bank.get_account(account_number)
    StatementPrinter.new(account.transactions.history)
  end
end
