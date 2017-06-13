require './app/lib/account.rb'
require './app/lib/statement_printer.rb'
require './app/lib/transactions.rb'

# App controller for Bank
class Interface
  attr_reader :accounts

  def initialize
    @accounts = []
    @available_acc_number = 11_111_111
  end

  def new_account
    @accounts.push(Account.new(@available_acc_number))
    @available_acc_number += 1
  end

  def deposit(account_number, value)
    account = get_account(account_number)
    account.deposit(value)
  end

  def withdrawal(account_number, value)
    account = get_account(account_number)
    account.withdrawal(value)
  end

  def statement(account_number)
    account = get_account(account_number)
    StatementPrinter.new(account.transactions.history)
  end

  def get_account(account_number)
    @accounts.find { |acc| acc.account_number == account_number }
  end
end