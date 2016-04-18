class PagesController < ApplicationController

  def updates
    d = Date.today - 1
    t = Time.new - 24*60*60
    @news = News.where(open: true).order(id: :desc).limit(5)
    @coming_games = Game.includes(:sente, :gote, :tournament).where('result is null and game_date >= ?', d).order(:game_date).limit(8)
    @coming_events = Event.includes(:country).where('start_time > ?', t).order(:start_time).limit(3)
    @updated_events = Event.includes(:country).order(updated_at: :desc).limit(5)
    @new_books = Book.includes(:language).order(issue_date: :desc).limit(3)
    @new_clubs = Club.includes(:country).order(created_at: :desc).limit(3)
    @new_websites = Website.includes(:country).order(created_at: :desc).limit(3)
  end

  def help
  end
end
