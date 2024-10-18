class ProfesoresController < ApplicationController
  before_action :authenticate_profesor!

  def menu_principal
    # Cargar los cursos del profesor autenticado para mostrarlos en el menú de "Grupos"
    @cursos = current_profesor.cursos
  end
end
