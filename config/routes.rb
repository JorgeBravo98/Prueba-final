Rails.application.routes.draw do
  get 'evaluaciones/index'
  get 'evaluaciones/new'
  get 'evaluaciones/create'
  get 'evaluaciones/edit'
  get 'evaluaciones/update'
  get 'evaluaciones/show'
  get 'evaluaciones/calificar'

  devise_for :profesors, path: 'profesores', controllers: {
    sessions: 'profesores/sessions',
    registrations: 'profesores/registrations'
  }

  # Ruta para el menú principal de alumnos
  get 'menu_principal_alumnos', to: 'alumnos#menu_principal', as: :alumnos_menu_principal
  get 'profesores/menu_principal', to: 'profesores#menu_principal', as: :profesores_menu_principal

  # Rutas para solicitudes de cursos y mensajes
  get 'solicitudes_cursos', to: 'cursos#solicitudes', as: 'solicitudes_cursos'
  get 'mensajes', to: 'mensajes#index', as: 'mensajes'

  # Devise para alumnos con un controlador personalizado para registrations
  devise_for :alumnos, path: 'alumnos', controllers: {
    registrations: 'alumnos/registrations'
  }

  # Devise para usuarios (sin controlador personalizado)
  devise_for :users

  # Letter Opener para entorno de desarrollo
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # Ruta raíz
  root "home#index"

  # Recurso para manejar acciones de usuarios
  resources :users, only: [:index]

  # Rutas para cursos y sus recursos anidados
  resources :cursos do
    collection do
      get 'mis_cursos', to: 'cursos#mis_cursos', as: 'mis_cursos_profesor'
    end

    

    resources :archivos, only: [:index, :new, :create, :destroy]

    # Anidamos grupos dentro de cursos
    resources :grupos, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  end

  resources :cursos do
    resources :evaluaciones, only: [:index, :new, :create, :edit, :update, :destroy, :show] do
      member do
        patch 'calificar', to: 'evaluaciones#calificar', as: 'calificar'
      end
    end
    resources :anuncios, only: [:index, :new, :create, :show, :destroy]
  end

  
  

  # Rutas para manejo de errores
  get "/404", to: "errors#not_found"
  get "/422", to: "errors#unprocessable_entity"
  get "/500", to: "errors#internal_server_error"
end

