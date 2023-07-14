class Api::V1::LibrariesUsersController < Api::V1::ApiController
  before_action :set_user, only: [:update]
  before_action :set_library
  before_action :set_api_v1_libraries_user, only: %i[ show destroy ]

  # GET /api/v1/libraries_users or /api/v1/libraries_users.json
  def index
    @api_v1_libraries_users = @library.users.all
    render json: ::UserSerializer.new(@api_v1_libraries_users).serializable_hash
  end

  # GET /api/v1/libraries_users/1 or /api/v1/libraries_users/1.json
  def show
    render json: ::UserSerializer.new(@api_v1_libraries_user).serializable_hash
  end

  # PATCH/PUT /api/v1/libraries_users/1 or /api/v1/libraries_users/1.json
  def update
    if @library.users << @user && @library.save
      render json: { status: :updated, object: ::LibrarySerializer.new(@library).serializable_hash }
    else
      render json: @library.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/libraries_users/1 or /api/v1/libraries_users/1.json
  def destroy
    @library.users.delete(@api_v1_libraries_user)
    render json: { status: :user_unassigned }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_libraries_user
      @api_v1_libraries_user = @library.users.find(params[:id])
    end

    def set_user
      @user = User.find(params[:id])
    end

    def set_library
      @library = Library.find(params[:library_id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_libraries_user_params
      params.fetch(:api_v1_libraries_user, {})
    end
end
