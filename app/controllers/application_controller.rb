class ApplicationController < ActionController::Base
  # Asegurarte de permitir los parámetros adicionales de Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Sobrescribir el método de redirección después del inicio de sesión
  # app/controllers/application_controller.rb
  def after_sign_in_path_for(resource)
    if resource.is_a?(Alumno)
      alumnos_menu_principal_path # Ruta correcta para alumnos
    elsif resource.is_a?(Profesor)
      profesores_menu_principal_path # Ruta correcta para profesores
    else
      root_path # Redirigir a la página de inicio para otros roles
    end
  end


  protected

  # Permitir los parámetros personalizados de Devise para el modelo Alumno
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellido, :numero_alumno])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
  end
end
