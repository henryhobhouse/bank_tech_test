describe StatementPrinter do
  let(:test_time) { Time.local(2008, 9, 1, 12, 0, 0) }
  let(:credithistory) do
    [{ datetime: test_time,
       type: 'credit',
       value: 12,
       balance: 100 }]
  end
  let(:debithistory) do
    [{ datetime: test_time,
       type: 'debit',
       value: 24,
       balance: 23 }]
  end

  let(:creditStatement) { described_class.new(credithistory) }
  let(:debitStatement) { described_class.new(debithistory) }

  it 'outputs a value of credit but leaves debit field blank. Two decimals on values' do
    expect { creditStatement }.to output("date || credit || debit || balance\n01/09/2008 || 12.00 ||  || 100.00\n").to_stdout
  end

  it 'outputs a value of debit but leaves credit blank. Two decimals on values' do
    expect { debitStatement }.to output("date || credit || debit || balance\n01/09/2008 ||  || 24.00 || 23.00\n").to_stdout
  end
end
