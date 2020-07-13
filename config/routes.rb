Rails.application.routes.draw do
  resources :songs, only: [:index, :new, :create, :edit, :show, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
