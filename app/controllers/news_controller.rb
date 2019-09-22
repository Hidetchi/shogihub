class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy, :instruction]
  before_action :authenticate_user!, only: [:edit, :update, :new, :create, :instruction, :destroy]
  authorize_resource

  respond_to :html

  def index
    @news = News.where(open: true).order(published_at: :desc).page(params[:page]).per(10)
  end

  def index_headlines
    @news = News.where(open: true).order(published_at: :desc).page(params[:page]).per(50)
  end

  def backyard
    @hide_skipped = params[:hide_skipped].present?
    @news = News.order(published_at: :desc).page(params[:page]).per(50)
    @news = @news.where.not(instruction:2) if @hide_skipped
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

  def preview
    @preview_news = News.new(content_en: params[:content_en])
  end

  def destroy
    @news.destroy
    respond_with(@news)
  end

  def instruction
    @news.update_attributes(instruction: params[:instruction])
    respond_with(@news)
  end

  private
    def set_news
      @news = News.find(params[:id])
    end

    def news_params
      params.require(:news).permit(:entry_id, :url, :published_at, :title_ja, :title_en, :content_ja, :content_en, :category, :status, :translator_id)
    end
end
