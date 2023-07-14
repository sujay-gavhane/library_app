class Api::V1::BooksController < Api::V1::ApiController
  before_action :set_library
  before_action :set_api_v1_book, only: %i[ show edit update destroy ]

  # GET /api/v1/books or /api/v1/books.json
  def index
    @api_v1_books = @library.books.all
    render json: ::BookSerializer.new(@api_v1_books).serializable_hash
  end

  # GET /api/v1/books/1 or /api/v1/books/1.json
  def show
    render json: ::BookSerializer.new(@api_v1_book).serializable_hash
  end

  # GET /api/v1/books/new
  def new
    @api_v1_book = @library.books.new
  end

  # GET /api/v1/books/1/edit
  def edit
  end

  # POST /api/v1/books or /api/v1/books.json
  def create
    @api_v1_book = @library.books.new(api_v1_book_params)

    if @api_v1_book.save
      render json: { status: :created, object: ::BookSerializer.new(@api_v1_book).serializable_hash }
    else
      render json: @api_v1_book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/books/1 or /api/v1/books/1.json
  def update
    if @api_v1_book.update(api_v1_book_params)
      render json: { status: :updated, object: ::BookSerializer.new(@api_v1_book).serializable_hash }
    else
      render json: @api_v1_book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/books/1 or /api/v1/books/1.json
  def destroy
    @api_v1_book.destroy

    render json: { status: :deleted }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_book
      @api_v1_book = @library.books.find(params[:id])
    end

    def set_library
      @library = Library.find(params[:library_id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_book_params
      params.permit(:name, :description, :library_id)
    end
end
