class GamesController < ApplicationController
  def index
    @players = User.all
    @game = Game.new
  end
end