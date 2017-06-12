require './app/lib/account.rb'
# App controller for Bank
class Bank
  attr_reader :accounts

  def initialize
    @accounts = []
    @available_acc_number = 11111111
  end

  def new_account
    @accounts.push(Account.new)
  end
end
