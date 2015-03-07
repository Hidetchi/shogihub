class PlayersController < ApplicationController

  def index
  end

  def show
    @player = Player.find(params[:id])
    @games = Game.includes(:sente, :gote, :tournament).where('sente_id = ? or gote_id = ?', @player.id, @player.id).order('game_date desc')
  end
end
