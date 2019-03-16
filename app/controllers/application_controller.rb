class ApplicationController < ActionController::API
  def res(result=nil, msg="not found")
    if result.present?
      render json: { status: 200, data: result }
    else
      render json: { status: 404, message: msg }
    end
  end
end
