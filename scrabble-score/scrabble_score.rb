class Scrabble
  private

  def self.flatten(scoring_dict)
    flattened_hash = Hash::new
    scoring_dict.keys.map { |letters_list|
      letters_list.map {
        |letter|
        [letter, scoring_dict[letters_list]]
      }.to_h
    }.each { |letters_hash| flattened_hash.merge!(letters_hash) }
    flattened_hash
  end

  # flatten the original scoring table to be in form
  # letter => score for quick access
  public

  SCORING_TABLE = flatten({
    ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
    ["D", "G"] => 2,
    ["B", "C", "M", "P"] => 3,
    ["F", "H", "V", "W", "Y"] => 4,
    ["K"] => 5,
    ["J", "X"] => 8,
    ["Q", "Z"] => 10,
  })
end
