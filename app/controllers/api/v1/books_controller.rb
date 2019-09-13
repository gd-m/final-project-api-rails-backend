class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    if logged_in?
      @books = Book.all
      books_json = BookSerializer.new(@books).serialized_json
      render json: books_json
    else
      render json: {
        error: "Please login"
      }
    end
  end

  # GET /books/1
  def show
    if logged_in?
      book_json = BookSerializer.new(@book).serialized_json
      render json: book_json
    else
      render json: {
        error: "Please Login or SignUp"
      }
    end
  end

  # POST /books
  def create
     if logged_in?
    @book = current_user.books.build(book_params)
    if @book.save
      book_json = BookSerializer.new(@book).serialized_json

      render json: book_json
    else
      render json: {
        error: "Error"
      }
    end
  else
    render json: {
      error: "Please Login"
    }
  end
    #   @book = Book.new(book_params)
    #     book_json = BookSerializer.new(@book).serialized_json
    #   render json: book_json, status: :created, location: @book
    #   else
    #     book_json = BookSerializer.new(@book).serialized_json
    #   render json: book_json.errors, status: :unprocessable_entity
    #   end
    # else
    #   render json: {
    #     error: "Please Login or SignUp"
    #   }
  end

  # PATCH/PUT /books/1
  def update
    if logged_in?
      if @book.update(book_params)
        book_json = BookSerializer.new(@book).serialized_json
      render json: book_json
      else
        book_json = BookSerializer.new(@book).serialized_json
      render json: book_json.errors, status: :unprocessable_entity
      end
    else
      render json: {
        error: "Please Login or SignUp"
      }
    end
  end

  # DELETE /books/1
  def destroy
    if logged_in?
      @book.destroy
    else
      render json: {
        error: "Please Login or SignUp"
      }
    end
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
