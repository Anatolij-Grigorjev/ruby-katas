class DigitRomanExpansion
  def initialize(lower_range_unit, midrange_unit, next_range_unit)
    @lower_range_unit = lower_range_unit
    @midrange_unit = midrange_unit
    @next_range_unit = next_range_unit
  end

  def expand_roman(arabic_digit)
    case arabic_digit
    when 0 then ""
    when 1..3
      @lower_range_unit * arabic_digit
    when 4
      @lower_range_unit + @midrange_unit
    when 5..8
      @midrange_unit + @lower_range_unit * (arabic_digit - 5)
    when 9
      @lower_range_unit + @next_range_unit
    else
      raise ArgumentError, "cannot create roman expansion from digit #{arabic_digit}"
    end
  end
end
