class GamesController < ApplicationController
  def index
    @players = User.all
    @games = Game.where(player_id: current_user.id) 
    @t = @games.map{|g| User.find(g.suggester_id).username}
  end

  def create
    @player_id = params['game']['player_id'].to_i
    @secret_word = params['game']['word']
    g = Game.create! player_id: @player_id, suggester_id: current_user.id, secret_word: @secret_word
    if g.save
      redirect_to games_path
    else
      redirect_to "www.google.com"
    end
  end

  def get_games
    @games = @games = Game.where(player_id = current_user)
    @t = @games.map{|g| User.find(g.suggester_id).username}
  end

  def show
    @current_game = Game.find("#{params[:id]}")
    secret_word = @current_game.secret_word
    @suggester = @current_game.suggester.username
    @letters_guessed = @current_game.letters_guessed
    h = Hangman.new secret_word 
    @secret_letters = secret_word.split("")
    @guess_word = @secret_letters.map do |letter|
      if @letters_guess.nil? || (@letters_guess.exclude? letter)
        "__"
      else
        letter
      end
    end
    
  end

  private
  def game_params
    params.require(:game).permit(:secret_word, :player_id)
  end
end