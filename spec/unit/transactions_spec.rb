describe Transactions do
  it 'initalizes with zero transactions' do
    expect(subject.history).to be_empty
  end

  context 'recording history' do
    before(:each) do
      test_time = Time.local(2008, 9, 1, 12, 0, 0)
      Timecop.freeze(test_time)
      subject.record('credit', 100, 100)
    end

    it 'account records deposit date and time' do
      expect(subject.history[0][:value]).to eq 100
      expect(subject.history[0][:type]).to eq 'credit'
      expect(subject.history[0][:datetime].strftime('%I:%M:%S')).to eq '12:00:00'
    end

    it 'account records withdrawal date and time' do
      subject.record('debit', 50, 50)
      expect(subject.history[1][:value]).to eq 50
      expect(subject.history[1][:type]).to eq 'debit'
      expect(subject.history[1][:datetime].strftime('%I:%M:%S')).to eq '12:00:00'
    end

    after(:each) do
      Timecop.return
    end
  end
end
