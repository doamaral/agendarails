Rails.application.routes.draw do
  get "/bemvindo" => "home#index"
  get 'home/index'
  root "home#index"

  #Criar as rotas pelo resource (recurso)
  resources :phones
  resources :addresses
  resources :contacts
  resources :kinds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
