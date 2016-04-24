class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :new, :create]

  respond_to :html

  def index
    @news = News.all.order(id: :desc).limit(100)
    @news_open = News.where(open: true).order(id: :desc).limit(100)
  end

  def index_detail
    @news_open = News.where(open: true).order(id: :desc).limit(100)
  end

  def show
    respond_with(@news)
  end

  def new
    @news = News.new
    @news.category = 0
    respond_with(@news)
  end

  def edit
    raise "access denied" unless current_user.is_admin?
  end

  def create
    @news = News.new(news_params)
    @news.entry_id = News.count == 0 ? 1 : News.last.id + 1
    @news.save
    respond_with(@news)
  end

  def update
    @news.update(news_params)
    if params[:news][:open].to_i == 1
      if (PublicActivity::Activity.find_by(trackable: @news) == nil)
        @news.create_activity(key: 'news.publish', owner: current_user)
      end
    end
    respond_with(@news)
  end

  def destroy
    @news.destroy
    respond_with(@news)
  end

  private
    def set_news
      @news = News.find(params[:id])
    end

    def news_params
      params.require(:news).permit(:entry_id, :url, :published_at, :title_ja, :title_en, :content_ja, :content_en, :category, :open)
    end
end
