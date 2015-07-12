class Hangman 
  attr_reader :word, :letters_guessed
  def initialize word, letters_guessed=""
      @word = word
      @letters_guessed = letters_guessed
      @secret_letters = @word.split(//)
      @letters_guessed_array = letters_guessed.split(//)
  end

  def bad_guess_count
    if @letters_guessed == ""
      0
    else
      g= @letters_guessed_array.delete_if {|letter| word.include?(letter)}
      g.count
    end
  end

  def over? 
    won? || lost?
  end

  def won? guess_word=@word
    @letters_guessed.include? @word
  end

  def lost? guess_word=@word
    bad_guess_count >= 6
  end

  def guess_word
    @secret_letters.map do |letter|
      if @letters_guessed.nil? || (@letters_guessed.exclude? letter)
        "__"
      else
        letter
      end
    end
  end

  # def compare guess_letter
  #   word_array = @word.strip.split(//)
  #   if word_array.include? guess_letter
  #     puts 'Good guess'
  #     match_index = word_array.each_index.select{|i| word_array[i] == guess_letter }
  #     match_index.each do |index|
  #       @guess_word[index] = guess_letter
  #     end
  #   end
  # end

end
