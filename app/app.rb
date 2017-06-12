require './app/lib/account.rb'

# App controller for Bank
class Bank
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
    account = accounts.find { |acc| acc.account_number == account_number }
    account.deposit(value)
  end

  def withdrawal(account_number, value)
    account = accounts.find { |acc| acc.account_number == account_number }
    account.withdrawal(value)
  end
end
