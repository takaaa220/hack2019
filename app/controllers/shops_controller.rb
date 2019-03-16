class ShopsController < ApplicationController
  def index
    @shops = Shop.all.map{|shop| res_model(shop)}
    render json: { status: 200, data: @shops }
  end

  def create
    unless user = User.find_by(uid: params[:uid])
      return render status: 401, json: { messages: "not login" }
    end

    shop = user.shops.build(shop_params)
    if shop.save
      render json: { data: res_model(shop) }
    else
      render status: 400, json: { data: res_model(shop), message: shop.errors.full_messages }
    end
  end

  def update
    user = User.find_by(uid: params[:uid])
    shop = user&.shops&.find_by(id: params[:id])
    if user.nil? || shop.nil?
      return render status: 401, json: { messages: "unauthorized access" }
    end

    if shop.update(shop_params)
      render json: { data: res_model(shop) }
    else
      render status: 400, json: { data: res_model(shop), message: shop.errors.full_messages }
    end
  end


  private

  def shop_params
    params.permit(:name, :description, :category)
  end

  def res_model(shop)
    {
      name: shop.name,
      category: shop.category,
      description: shop.description
    }
  end
end
