class CursosController < ApplicationController
    before_action :authenticate_profesor! # Asegúrate de que el profesor esté autenticado
  
    def new
      @curso = Curso.new
      @profesor = current_profesor # Obtiene el profesor actual
    end
  
    def create
      @curso = Curso.new(curso_params) # Inicializa el curso con los parámetros permitidos
      @curso.profesor_id = current_profesor.id # Asignar el ID del profesor
  
      puts "Intentando guardar curso con profesor_id: #{@curso.profesor_id}"
  
      if @curso.save
        redirect_to @curso, notice: 'Curso creado exitosamente.'
      else
        render :new
      end
    end
  
    private
  
    def curso_params
      # Permite solo los atributos necesarios para crear un curso, incluyendo profesor_id
      params.require(:curso).permit(:nombre, :sigla, :profesor_id)
    end
  end
  