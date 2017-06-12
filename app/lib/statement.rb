# Allows bank to output account history
class PrintStatement
  def initialize(history)
    print_header
    history.each do |transaction|
      print_body(transaction)
      puts ''
    end
  end

  private

  def print_header
    puts 'date || credit || debit || balance'
  end

  def print_body(transaction)
    print transaction[:datetime].strftime('%d/%m/%Y')
    print ' || '
    transaction_type(transaction)
    print ' || '
    printf('%.2f', transaction[:balance])
  end

  def transaction_type(transaction)
    if transaction[:credit].nil?
      print_debit(transaction)
    else
      print_credit(transaction)
    end
  end

  def print_debit(transaction)
    print ' || '
    printf('%.2f', transaction[:debit])
  end

  def print_credit(transaction)
    printf('%.2f', transaction[:credit])
    print ' || '
  end
end
