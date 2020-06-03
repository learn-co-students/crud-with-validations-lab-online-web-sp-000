Rails.application.routes.draw do
  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :songs, only: [:new, :create, :show, :index, :edit, :update, :delete]
end
