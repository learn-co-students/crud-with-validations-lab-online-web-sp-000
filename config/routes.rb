Rails.application.routes.draw do
  resources :songs
  delete '/song/:id', to: 'song#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
