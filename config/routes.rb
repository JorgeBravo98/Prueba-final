Rails.application.routes.draw do
  devise_for :profesors
  # Ruta para el menú principal de alumnos
  get 'menu_principal_alumnos', to: 'alumnos#menu_principal'
  get 'profesores/menu_principal', to: 'profesores#menu_principal', as: :profesores_menu_principal


  # Devise para alumnos con un controlador personalizado para registrations
  devise_for :alumnos, controllers: { registrations: 'registrations' }

  # Devise para usuarios (sin controlador personalizado)
  devise_for :users

  # Letter Opener para entorno de desarrollo (envía correos a través de la web)
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # Ruta raíz
  root "home#index"

  # Recurso para manejar acciones de usuarios
  resources :users, only: [:index]


  resources :cursos do
    collection do
      get 'new/:profesor_id', to: 'cursos#new', as: 'new_with_profesor'
    end
  end
  

end
