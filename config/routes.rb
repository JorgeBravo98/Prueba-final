Rails.application.routes.draw do
  devise_for :alumnos
  get 'users/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  

  # Defines the root path route ("/")
  root "home#index"
  resources :users, only: [:index]
end
