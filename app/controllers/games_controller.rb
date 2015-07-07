class GamesController < ApplicationController
  def index
    @players = User.all
    @game = Game.new
  end

  def create
  end
end