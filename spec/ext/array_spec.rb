describe Array do
  subject { [[]] }

  it 'to_swagger' do
    expect(subject.to_swagger).to eq(
      'type' => 'array',
      'items' => {
        'type' => 'array',
        'items' => {}
      }
    )
  end
end
