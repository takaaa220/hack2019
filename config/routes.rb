Rails.application.routes.draw do
  resources :shops, only: %i(index)
  resources :users, only: %i(show)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
