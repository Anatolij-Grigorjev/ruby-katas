class Luhn
  def self.valid?(number_string = "")
    digits_text = number_string.delete(" ")
    if non_digit_chars?(digits_text) or digits_text.length == 1
      return false
    end

    multiplied_digits = digits_text.reverse.chars.map.with_index { |digit, idx|
      if idx % 2 == 0
        digit
      else
        try_double_digit(digit)
      end
    }

    sum = multiplied_digits.map(&:to_i).reduce(:+)

    return sum % 10 == 0
  end

  private

  def self.non_digit_chars?(digit_text)
    digit_text.chars.any? { |digit| not(("0".."9").include? digit) }
  end

  def self.try_double_digit(digit_string)
    digit = digit_string.to_i
    doubled = digit * 2
    if doubled <= 9
      doubled
    else
      doubled - 9
    end
  end
end
