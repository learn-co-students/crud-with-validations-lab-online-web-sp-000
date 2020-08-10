Rails.application.routes.draw do
  resources :songs, only: [:index, :show, :edit, :new, :destroy, :update, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
