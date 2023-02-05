class Integer
  def to_roman
    if self > 3000
      raise ArgumentError, "Numbers above 3000 not supported for numerals conversion to Roman!"
    end
    self
  end
end
