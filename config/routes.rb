Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :songs, only: [:index, :new, :show, :edit, :create]
  patch '/songs/:id', to: 'songs#update'
  delete '/songs/:id', to: 'songs#destroy'
end
