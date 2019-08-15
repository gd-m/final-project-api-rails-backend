class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    @books = Book.all
    books_json = BookSerializer.new(@books).serialized_json
    render json: books_json
  end

  # GET /books/1
  def show
    book_json = BookSerializer.new(@book).serialized_json
    render json: book_json
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      book_json = BookSerializer.new(@book).serialized_json
    render json: book_json, status: :created, location: @book
    else
      book_json = BookSerializer.new(@book).serialized_json
    render json: book_json.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      book_json = BookSerializer.new(@book).serialized_json
    render json: book_json
    else
      book_json = BookSerializer.new(@book).serialized_json
    render json: book_json.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:title, :author)
    end
end
