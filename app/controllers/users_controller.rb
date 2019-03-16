class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    res(@user.res_model)
  end
end
