class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def create
    user = User.new(user_params)
    if user.save
      hash = UserSerializer.new(user).serializable_hash
      command = AuthenticateUser.call(user_params[:email], user_params[:password])
      if command.success?
        hash[:data][:attributes][:auth_token] = command.result
        render json: hash.to_json
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    else
      render json: {error: user.errors.full_messages.join(',')}, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user).serializable_hash.to_json
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :balance)
  end
end
