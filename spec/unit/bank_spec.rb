# Bank exists
describe Bank do
  let(:bank) { Bank.new }

  it 'bank has no accounts on initialize' do
    expect(subject.accounts).to be_empty
  end
end
