class ApplicationController < ActionController::Base
  # Asegurarte de permitir los parámetros adicionales de Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Sobrescribir el método de redirección después del inicio de sesión
  def after_sign_in_path_for(resource)
    # Si el usuario que inicia sesión es un Alumno, redirige a la página principal de alumnos
    if resource.is_a?(Alumno)
      menu_principal_alumnos_path # Redirigir a la ruta que lleva al menú principal de los alumnos
    elsif resource.is_a?(Profesor)
      profesores_menu_principal_path # Cambia a la ruta que apunta a tu página principal de profesores
    else
      super # Si no es Alumno o Profesor, aplica el comportamiento por defecto de Devise
    end
  end

  protected

  # Permitir los parámetros personalizados de Devise para el modelo Alumno
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellido, :numero_alumno])
  end
end
