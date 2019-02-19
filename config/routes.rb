Rails.application.routes.draw do
  resources :songs, only: [:show, :new, :update, :edit, :create, :index, :destroy]
  patch 'songs/:id', to: 'song#update'
end
