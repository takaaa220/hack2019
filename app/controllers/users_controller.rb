class UsersController < ApplicationController
  def index
    @users = User.all.map(&:res_model)
    render json: { status: 200, data: @users }
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: { status: 200, data: @user.res_model }
  end
end
