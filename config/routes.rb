Rails.application.routes.draw do
  resources :songs
  get "songs/:id/change_genre", to: "songs#change_genre", as: "change_genre"
  post "songs/:id/update_genre", to: "songs#update_genre", as: "update_genre"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
