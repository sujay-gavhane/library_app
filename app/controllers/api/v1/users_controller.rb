class Api::V1::UsersController < Api::V1::ApiController
  skip_before_action :authenticate_user, only: [:create]
  before_action :set_api_v1_user, only: %i[ show edit update destroy ]

  # GET /api/v1/users or /api/v1/users.json
  def index
    @api_v1_users = User.all
    render json: ::UserSerializer.new(@api_v1_users).serializable_hash
  end

  # GET /api/v1/users/1 or /api/v1/users/1.json
  def show
    render json: ::UserSerializer.new(@api_v1_user).serializable_hash
  end

  # GET /api/v1/users/new
  def new
    @api_v1_user = User.new
  end

  # GET /api/v1/users/1/edit
  def edit
  end

  # POST /api/v1/users or /api/v1/users.json
  def create
    @api_v1_user = User.new(api_v1_user_params)

    if @api_v1_user.save
      render json: { status: :created, object: ::UserSerializer.new(@api_v1_user).serializable_hash }
    else
      render json: @api_v1_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1 or /api/v1/users/1.json
  def update
    if @api_v1_user.update(api_v1_user_params)
      render json: { status: :updated, object: ::UserSerializer.new(@api_v1_user).serializable_hash }
    else
      render json: @api_v1_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1 or /api/v1/users/1.json
  def destroy
    @api_v1_user.destroy

    render json: { status: :deleted }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_user
      @api_v1_user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_user_params
      params.permit(:full_name, :email, :password)
    end
end
