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
    uniq_letters_needed = @word.split(//).uniq
    uniq_letters_available = @letters_guessed.split(//).uniq
    diff = uniq_letters_needed - uniq_letters_available
    diff.count == 0

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

end
