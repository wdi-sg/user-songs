Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :songs do
    resources :users
  end

  root to: 'songs#index'
  # get 'profile', to:'users#show'
end
