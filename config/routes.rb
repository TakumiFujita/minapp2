Rails.application.routes.draw do
  devise_for :users
root "posts#index"
resources :posts do
  resources :comments
  resources :likes, only: [:create, :destroy]
end
resources :users, only: [:show]

end
