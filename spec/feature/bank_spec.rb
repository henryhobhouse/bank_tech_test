describe Bank do
  it 'bank has no accounts on initialize' do
    expect(subject.accounts).to be_empty
  end

  it 'accounts can have a new account' do
    subject.new_account
    expect(subject.accounts.count).to eq 1
  end

  it 'new accounts will be assigned unique ID' do
    subject.new_account
    subject.new_account
    expect(subject.accounts[0].account_number).to eq 11_111_111
    expect(subject.accounts[1].account_number).to eq 11_111_112
  end

  it 'Bank can deposit into an specific account' do
    subject.new_account
    subject.deposit(11_111_111, 100)
    expect(subject.accounts[0].balance).to eq 100
  end
end
