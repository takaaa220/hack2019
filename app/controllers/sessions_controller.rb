class SessionsController < ApplicationController
  def callback
    auth = request.env['omniauth.auth']
    binding.pry
    user = User.create_or_find_with_twitter(auth)

    res(user&.res_model)
  end
end
