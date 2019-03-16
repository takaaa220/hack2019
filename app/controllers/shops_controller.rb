class ShopsController < ApplicationController
  def index
    @shops = Shop.all.map{|shop| res_model(shop)}
    render json: { status: 200, data: @shops }
  end

  def create
    user = User.find_by(uid: paams[:uid])
    shop = Shop.new(shpp_params)
    if shop.save
      render json: { status: 200, data: res_model(shop) }
    else
      render json: { status: 400, data: res_model(shop), message: shop.errors.messages }
    end
  end

  def update
  end


  private

  def shop_params
    params.permit!(:name, :description, :category)
  end

  def res_model(shop)
    {
      name: shop.name,
      category: shop.category,
      description: shop.description
    }
  end
end
