class Profesores::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    
    protected
    
    # Permitir parámetros adicionales
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellido, :nombre_usuario, :avatar, :lista_cursos])
    end
  end
  