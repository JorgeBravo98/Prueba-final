Rails.application.routes.draw do
  devise_for :profesors, path: 'profesores', controllers: {
    sessions: 'profesores/sessions',
    registrations: 'profesores/registrations'
  }
  # Ruta para el menú principal de alumnos
  get 'menu_principal_alumnos', to: 'alumnos#menu_principal', as: :alumnos_menu_principal
  get 'profesores/menu_principal', to: 'profesores#menu_principal', as: :profesores_menu_principal


  # Devise para alumnos con un controlador personalizado para registrations
  devise_for :alumnos, path: 'alumnos', controllers: {
    registrations: 'alumnos/registrations'
  }


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
      get 'mis_cursos', to: 'cursos#mis_cursos', as: 'mis_cursos_profesor'
    end
    resources :grupos, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  end
  
  

  # Rutas para manejo de errores
  get "/404", to: "errors#not_found"
  get "/422", to: "errors#unprocessable_entity"
  get "/500", to: "errors#internal_server_error"

  

end
