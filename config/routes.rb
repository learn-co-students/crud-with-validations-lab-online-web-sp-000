Rails.application.routes.draw do
root 'songs#index'
get 'songs/index', to: 'songs#index'

  resources :songs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
