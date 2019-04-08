Rails.application.routes.draw do
  root 'songs#index'
  resources :songs
  patch 'songs/:id', to: 'songs#update'
end
