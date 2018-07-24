describe TrueClass do
  subject { true }

  it 'to_swagger' do
    expect(subject.to_swagger).to eq('type' => 'boolean', 'example' => true)
  end
end
