require_relative "digit_roman_expansion"

class Integer
  ROMAN_EXPANSIONS = [
    #0 - 9
    DigitRomanExpansion::new("I", "V", "X"),
    #10 - 90
    DigitRomanExpansion::new("X", "L", "C"),
    #100 - 900
    DigitRomanExpansion::new("C", "D", "M"),
    #1000+
    DigitRomanExpansion::new("M", nil, nil),
  ]

  def to_roman
    if self > 3000
      raise ArgumentError, "Numbers above 3000 not supported for numerals conversion to Roman!"
    end
    self.to_s.chars.reverse
        .map.with_index { |digit, idx| ROMAN_EXPANSIONS[idx].expand_roman(digit.to_i) }
        .reverse.join
  end
end
