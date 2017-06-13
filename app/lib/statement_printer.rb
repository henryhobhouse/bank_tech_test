# Allows bank to output account history
module StatementPrinter
  def self.print_statement(transactions)
    print_header
    transactions.each do |transaction|
      print_body(transaction)
      puts ''
    end
  end

  private

  def self.print_header
    puts 'date || credit || debit || balance'
  end

  def self.print_body(transaction)
    print transaction[:datetime].strftime('%d/%m/%Y')
    print ' || '
    transaction_type(transaction)
    print ' || '
    printf('%.2f', transaction[:balance])
  end

  def self.transaction_type(transaction)
    if transaction[:type] == 'debit'
      print_debit(transaction)
    else
      print_credit(transaction)
    end
  end

  def self.print_debit(transaction)
    print ' || '
    printf('%.2f', transaction[:value])
  end

  def self.print_credit(transaction)
    printf('%.2f', transaction[:value])
    print ' || '
  end
end
