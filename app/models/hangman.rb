class Hangman 
  attr_reader :tries, :word, :guess_word
  def initialize word
      @word = word.strip 
      #@tries = 3

      @guess_word = []
      #should map here...
      (@word.length).times do |blank|
        @guess_word << "__ "
      end
  end

  def over?
    @tries <=0 || @guess_word.join == @word
  end
  def won?
    @guess_word.join == @word
  end

  def lost?
    @tries == 0
  end
  def compare guess_letter
    #@guesses -= 1
    word_array = @word.strip.split(//)
    if word_array.include? guess_letter
      puts 'Good guess'
      #index_to_be_replaced = word_array.index(guess_letter)
      match_index = word_array.each_index.select{|i| word_array[i] == guess_letter }
      match_index.each do |index|
        @guess_word[index] = guess_letter
      end
      #@guess_word[index_to_be_replaced] = guess_letter
    else
      puts "Bad guess"
      @tries -= 1
    end
  end

end
