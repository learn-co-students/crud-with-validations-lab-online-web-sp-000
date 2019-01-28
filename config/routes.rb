Rails.application.routes.draw do
  resources :songs, only: [:new, :index, :show, :edit, :create, :update, :destroy]

end
