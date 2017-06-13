require './app/lib/account.rb'

# responsible for creating and controlling accounts
class Bank
  attr_reader :accounts

  def initialize
    @accounts = []
    @available_acc_number = 11_111_111
  end

  def new_account
    accounts.push(Account.new(@available_acc_number))
    @available_acc_number += 1
  end

  def get_account(account_number)
    @accounts.find { |acc| acc.account_number == account_number }
  end
end
