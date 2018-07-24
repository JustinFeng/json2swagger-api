describe FalseClass do
  subject { false }

  it 'to_swagger' do
    expect(subject.to_swagger).to eq('type' => 'boolean', 'example' => false)
  end
end
