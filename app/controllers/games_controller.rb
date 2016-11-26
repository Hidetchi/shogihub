class GamesController < ApplicationController
  def index
    @games = Game.includes(:sente, :gote, :tournament).limit(500).order('game_date desc')
  end
end
