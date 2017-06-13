describe Bank do
  let(:Account) { class_double('Account') }

  it 'Bank has no accounts on initialization' do
    expect(subject.accounts).to be_empty
  end

  context 'creating new accounts' do
    before(:each) do
      subject.new_account
    end
    it 'new accounts will be assigned a unique ID' do
      subject.new_account
      expect(subject.accounts[0].account_number).to eq 11_111_111
      expect(subject.accounts[1].account_number).to eq 11_111_112
    end

    it 'Bank can create a new account' do
      expect(subject.accounts.count).to eq 1
    end
  end
end
