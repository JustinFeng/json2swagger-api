class Integer
  def to_swagger
    { 'type' => 'integer', 'example' => self }
  end
end
