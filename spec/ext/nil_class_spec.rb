describe NilClass do
  subject { nil }

  it 'to_swagger' do
    expect(subject.to_swagger).to eq('type' => 'UNKNOWN')
  end
end
