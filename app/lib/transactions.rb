require 'date'

# responsible for recording all transactions for each account
class Transactions
  attr_reader :history

  def initialize
    @history = []
  end

  def record(type, value, balance)
    @history.push(datetime: DateTime.now,
                  type: type,
                  value: value,
                  balance: balance)
  end
end
