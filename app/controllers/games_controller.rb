class GamesController < ApplicationController
  def index
    @games = Game.includes(:sente, :gote, :tournament).limit(200).order('game_date desc')
  end
end
