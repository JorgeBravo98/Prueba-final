class ProfesoresController < ApplicationController
    before_action :authenticate_profesor!
  
    def menu_principal
      # Aquí puedes agregar cualquier lógica o cargar datos que necesites para la vista del menú principal de profesores.
    end
  end
  