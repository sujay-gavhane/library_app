class Api::V1::LibrariesController < Api::V1::ApiController
  before_action :set_api_v1_library, only: %i[ show edit update destroy ]

  # GET /api/v1/libraries or /api/v1/libraries.json
  def index
    @api_v1_libraries = Library.all
    render json: ::LibrarySerializer.new(@api_v1_libraries).serializable_hash
  end

  # GET /api/v1/libraries/1 or /api/v1/libraries/1.json
  def show
    render json: ::LibrarySerializer.new(@api_v1_library).serializable_hash
  end

  # GET /api/v1/libraries/new
  def new
    @api_v1_library = Library.new
  end

  # GET /api/v1/libraries/1/edit
  def edit
  end

  # POST /api/v1/libraries or /api/v1/libraries.json
  def create
    @api_v1_library = Library.new(api_v1_library_params)

    if @api_v1_library.save
      render json: { status: :created, object: ::LibrarySerializer.new(@api_v1_library).serializable_hash }
    else
      render json: @api_v1_library.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/libraries/1 or /api/v1/libraries/1.json
  def update
    if @api_v1_library.update(api_v1_library_params)
      render json: { status: :updated, object: ::LibrarySerializer.new(@api_v1_library).serializable_hash }
    else
      render json: @api_v1_library.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/libraries/1 or /api/v1/libraries/1.json
  def destroy
    @api_v1_library.destroy

    render json: { status: :deleted }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_library
      @api_v1_library = Library.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_library_params
      params.permit(:name, :description, :location)
    end
end
