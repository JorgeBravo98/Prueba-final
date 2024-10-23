# app/controllers/alumnos/registrations_controller.rb
class Alumnos::RegistrationsController < Devise::RegistrationsController
    protected
  
    # Redirecciona después de la actualización del perfil de un alumno
    def after_update_path_for(resource)
      menu_principal_alumnos_path # Redirige al menú principal de alumnos
    end
  end
  