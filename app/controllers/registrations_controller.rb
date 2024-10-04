class RegistrationsController < Devise::RegistrationsController
    protected
  
    # Redirigir al inicio de sesión después de registrarse, pero antes de la confirmación
    def after_inactive_sign_up_path_for(resource)
      flash[:notice] = "Por favor confirma tu cuenta a través del enlace que hemos enviado a tu correo electrónico."
      new_session_path(resource_name) # Redirige a la página de inicio de sesión
    end
  end
  