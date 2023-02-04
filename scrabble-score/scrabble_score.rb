class Scrabble
  private

  def self.flatten(scoring_dict)
    scoring_dict.keys.map { |letters_list|
      letters_list.map {
        |letter|
        [letter, scoring_dict[letters_list]]
      }.to_h
    }.reduce(Hash::new, :merge!)
  end

  public

  # flatten the original scoring table to be in form
  # letter => score for quick access
  SCORING_TABLE = flatten({
    ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
    ["D", "G"] => 2,
    ["B", "C", "M", "P"] => 3,
    ["F", "H", "V", "W", "Y"] => 4,
    ["K"] => 5,
    ["J", "X"] => 8,
    ["Q", "Z"] => 10,
  }).freeze

  def initialize(word_string)
    @scrabble_word = word_string.nil? ? "" : word_string
  end

  def score
    @scrabble_word
      .upcase
      .chars
      .map { |character| SCORING_TABLE[character] }
      .select { |score| !!score }
      .reduce(0, :+)
  end

  def self.score(scrabble_word)
    Scrabble::new(scrabble_word).score
  end
end
