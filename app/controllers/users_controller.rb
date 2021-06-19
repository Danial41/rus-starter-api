class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @user = User.new(user_params)
    if @user.save && is_equal?(params)
      token = encode_token({user_id: @user.id})
      user_serializer = parse_json @user
      render json: {user: user_serializer, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: user_params[:email])

    if @user && @user.authenticate(user_params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end


  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation, :email, :image)
  end
end
