class UsersController < ApplicationController
  before_action :user_params, only: [:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created successfully"
      render status: :ok, json: { notice: 'Account created successfully'}
    else
      render status: :unprocessable_entity, json: { errors: @user.errors.full_messages}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
