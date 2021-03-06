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
    redirect_to games_path
  end

  def get_games
    @games = Game.where(player_id: current_user)
    @t = @games.map{|g| User.find(g.suggester_id).username}
  end

  def show
    @current_game = Game.find("#{params[:id]}")
    secret_word = @current_game.secret_word
    @suggester = @current_game.suggester.username
    @letters_guessed = @current_game.letters_guessed
    h = Hangman.new secret_word, @letters_guessed
    @guess_word = h.guess_word
      if h.lost? @current_game.letters_guessed
        # @bad_guess_letters = @current_game.letters_guessed
        flash[:notice] = "You are out of guesses.  You lost the game! The word was #{secret_word}."
        redirect_to games_path
      elsif h.won? @guess_word
        # @bad_guess_letters = @current_game.letters_guessed
        flash[:notice] = "You have guessed the word #{secret_word}.  Well done."
        redirect_to games_path
      end
  end

  def guess
    guess_letter = params["guess_letter"]
    g = Game.find(params["game_id"])
    old_letters_guessed = g.letters_guessed
    new_letters_guessed = old_letters_guessed << guess_letter
    g.update!(letters_guessed: new_letters_guessed)
    redirect_to game_path(g)

  end

  private
  def game_params
    params.require(:game).permit(:secret_word, :player_id)
  end
end