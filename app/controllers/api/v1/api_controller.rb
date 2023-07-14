class Api::V1::ApiController < ActionController::Base
  include JwtToken

  skip_before_action :verify_authenticity_token
  before_action :authenticate_user

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render json: { status: 404, message: 'record_not_found' }
  end

  private

  def authenticate_user
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = self.decode(header)
      @currect_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
