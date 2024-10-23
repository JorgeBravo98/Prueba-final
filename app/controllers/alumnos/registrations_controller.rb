# app/controllers/alumnos/registrations_controller.rb
class Alumnos::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  protected

  # Permitir todos los parámetros del registro de alumnos
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :numero_alumno,
      :email,
      :nombre,
      :apellido,
      :nombre_usuario,
      :contraseña,  # Aunque en Devise no es necesario incluirlo, está bien por claridad
      :avatar
    ])
  end

  # Redirecciona después de la actualización del perfil de un alumno
  def after_update_path_for(resource)
    menu_principal_alumnos_path # Redirige al menú principal de alumnos
  end
end
  