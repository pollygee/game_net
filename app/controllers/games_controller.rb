class GamesController < ApplicationController
  def index
    @players = User.all
    @game = Game.new
  end

  def create
    @player_id = params['game']['player_id'].to_i
    @secret_word = params['game']['word']
    Game.create! player_id: @player_id, suggester_id: current_user.id, secret_word: @secret_word
  end
end