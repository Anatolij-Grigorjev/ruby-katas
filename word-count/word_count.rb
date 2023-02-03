class Phrase

    def initialize(phrase_text)
        @phrase_text = phrase_text
        @occurrences = @phrase_text.delete(".&^!?\";:@$%").downcase.strip.scan(/[\w'-]+/)
            .map { |word| 
                if word_quoted?(word) 
                    stripped(word) 
                else 
                    word 
                end 
            }
            .tally()
    end

    def word_count()
        @occurrences
    end

    private

    def word_quoted?(word)
        word.start_with?("'") and word.end_with?("'")
    end

    def stripped(word)
        word[1, word.length - 2]
    end
end