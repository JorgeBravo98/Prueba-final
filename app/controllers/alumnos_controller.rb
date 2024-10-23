class AlumnosController < ApplicationController
  before_action :authenticate_alumno!

  def menu_principal
    # Aquí puedes agregar la lógica o renderizar la vista del menú principal de alumnos
    @cursos = current_alumno.cursos
  end
end
