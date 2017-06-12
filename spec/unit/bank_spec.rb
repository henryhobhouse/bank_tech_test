# Bank exists
describe Bank do
  let(:bank) { Bank.new }

  it 'bank has no accounts on initialize' do
    expect(subject.accounts).to be_empty
  end

  it 'accounts can have a new account' do
    subject.new_account
    expect(subject.accounts.count).to eq 1
  end
end
