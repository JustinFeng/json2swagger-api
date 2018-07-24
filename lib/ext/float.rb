class Float
  def to_swagger
    { 'type' => 'number', 'example' => self }
  end
end
