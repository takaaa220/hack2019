class ShopsController < ApplicationController
  def index
    @shops = Shop.all.map{|shop| res_model(shop)}
    res @shops
  end

  private

  def res_model(shop)
    {
      name: shop.name,
      category: shop.category,
      description: shop.description
    }
  end
end
