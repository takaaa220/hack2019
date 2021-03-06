Rails.application.routes.draw do
  resources :shops, only: %i(index create update)
  resources :users, only: %i(index show)
  get '/auth/twitter/callback' => 'sessions#callback'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
