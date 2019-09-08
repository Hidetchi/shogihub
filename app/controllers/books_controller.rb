class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  authorize_resource

  respond_to :html

  def index
    @today = Date.today
    @books = Book.all.order(:language_id, issue_date: :desc)
    respond_with(@books)
  end

  def show
    respond_with(@book)
  end

  def new
    @book = Book.new
    respond_with(@book)
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.save
    @book.create_activity(action: 'create', owner: current_user)
    respond_with(@book)
  end

  def update
    @book.update(book_params)
    respond_with(@book)
  end

  def destroy
    @book.destroy
    respond_with(@book)
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:isbn, :language_id, :title, :author, :publisher, :issue_date, :translator, :url, :image_url, :category, :description, :stars)
    end
end
