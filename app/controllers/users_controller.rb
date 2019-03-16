class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    res(res_model(@user))
  end

  private
  def res_model(user)
    {
      uid: user.uid,
      name: user.name
    }
  end
end
