class PlayersController < ApplicationController

  def index
    @root_players = Player.where(teacher_id: nil).order(:kishi_id, :birthday)
  end

  def active
    @pros = Player.where(category: 1, retired: false).order(rank: :desc, kishi_id: :asc)
    @ladies = Player.where(category: 2, retired: false).order(rank: :desc, kishi_id: :asc)
  end

  def show
    @player = Player.includes(:teacher, :pupils).find(params[:id])
    @player.load_JSA_detail if @player.name == nil && (@player.category == 1 || @player.category == 2)
    @events = @player.events.order(:start_time)
    @games = Game.includes(:sente, :gote, :tournament).where('sente_id = ? or gote_id = ?', @player.id, @player.id).order('game_date desc').page(params[:page]).per(100)
  end
end
