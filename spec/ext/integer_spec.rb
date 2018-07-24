describe Integer do
  subject { 1 }

  it 'to_swagger' do
    expect(subject.to_swagger).to eq('type' => 'integer', 'example' => 1)
  end
end
