class String
  def to_swagger
    { 'type' => 'string', 'example' => self }
  end
end
