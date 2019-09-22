class GamesController < ApplicationController
  def index
    @games = Game.includes(:sente, :gote, :tournament).order('game_date desc').page(params[:page]).per(100)
  end
end
