class GruposController < ApplicationController
    before_action :set_curso
  
    def index
      @grupos = @curso.grupos
    end
  
    def new
      @grupo = @curso.grupos.new
      @alumnos = Alumno.all # Obtener todos los alumnos existentes
    end
  
    def create
      @grupo = @curso.grupos.new(grupo_params)
      if @grupo.save
        redirect_to curso_grupos_path(@curso), notice: 'Grupo creado exitosamente.'
      else
        @alumnos = Alumno.all # Asegúrate de volver a cargar los alumnos si falla la creación
        render :new
      end
    end
  
    private
  
    def set_curso
      @curso = Curso.find(params[:curso_id])
    end
  
    def grupo_params
      params.require(:grupo).permit(:nombre, alumno_ids: [])
    end
  end
  