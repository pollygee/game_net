Rails.application.routes.draw do
  devise_for :users

  resources :games do
    post "guess"
  end

  root to: 'games#index'
end
