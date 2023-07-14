class Api::V1::UsersBooksController < Api::V1::ApiController
  before_action :set_user
  before_action :set_book, except: [:index]
  before_action :set_api_v1_users_book, only: %i[ show destroy ]

  # GET /api/v1/users_books or /api/v1/users_books.json
  def index
    @api_v1_users_books = @user.books.all
    render json: ::BookSerializer.new(@api_v1_users_books).serializable_hash
  end

  # GET /api/v1/users_books/1 or /api/v1/users_books/1.json
  def show
    render json: ::BookSerializer.new(@api_v1_users_book).serializable_hash
  end

  # PATCH/PUT /api/v1/users_books/1 or /api/v1/users_books/1.json
  def update
    if @book.is_book_already_assigned && @book.user_and_book_belongs_to_same_library(@user) &&
      @book.update(user: @user, status: :checked_out)
      render json: { status: :updated, object: ::BookSerializer.new(@book).serializable_hash }
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users_books/1 or /api/v1/users_books/1.json
  def destroy
    @api_v1_users_book.update(user_id: nil, status: :available)
    render json: { status: :book_unassigned }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_users_book
      @api_v1_users_book = @user.books.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_users_book_params
      params.permit(:name, :description, :user_id)
    end
end
