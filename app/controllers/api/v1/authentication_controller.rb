class Api::V1::AuthenticationController < Api::V1::ApiController

  skip_before_action :authenticate_user

  # POST /auth/login
  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = self.encode({ user_id: @user.id })
      time = Time.now + 30.minutes.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"), username: @user.full_name }, status: :ok
    else
      render json: { error: :unauthorized }, status: :unauthorized
    end
  end
end
