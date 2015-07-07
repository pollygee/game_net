class GamesController < ApplicationController
  def index
    @players = User.all
  end
end