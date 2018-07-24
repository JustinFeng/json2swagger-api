class Array
  def to_swagger
    { 'type' => 'array', 'items' => {} }
      .tap { |swagger| swagger['items'] = self[0].to_swagger unless empty? }
  end
end
