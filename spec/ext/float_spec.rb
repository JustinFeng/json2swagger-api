describe Integer do
  subject { 1.1 }

  it 'to_swagger' do
    expect(subject.to_swagger).to eq('type' => 'number', 'example' => 1.1)
  end
end
