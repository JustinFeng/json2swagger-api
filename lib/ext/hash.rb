class Hash
  def to_swagger
    { 'type' => 'object', 'properties' => {} }
      .tap { |swagger| each_pair { |k, v| swagger['properties'][k] = v.to_swagger } }
  end
end
