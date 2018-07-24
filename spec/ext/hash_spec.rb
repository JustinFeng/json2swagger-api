describe Hash do
  subject { { 'a' => {} } }

  it 'to_swagger' do
    expect(subject.to_swagger).to eq(
      'type' => 'object',
      'properties' => {
        'a' => {
          'type' => 'object',
          'properties' => {}
        }
      }
    )
  end
end
