class PlayersController < ApplicationController

  def index
    @root_players = Player.where(teacher_id: nil).order(:kishi_id, :birthday)
  end

  def show
    @player = Player.includes(:teacher, :pupils).find(params[:id])
    @games = Game.includes(:sente, :gote, :tournament).where('sente_id = ? or gote_id = ?', @player.id, @player.id).order('game_date desc')
  end
end
