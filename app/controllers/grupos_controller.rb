class GruposController < ApplicationController
    before_action :set_curso
  
    def index
      @grupos = @curso.grupos
    end
  
    def new
      @grupo = @curso.grupos.new
    end
  
    def create
      @grupo = @curso.grupos.new(grupo_params)
      if @grupo.save
        redirect_to curso_grupos_path(@curso), notice: 'Grupo creado exitosamente.'
      else
        render :new
      end
    end
  
    private
  
    def set_curso
      @curso = Curso.find(params[:curso_id])
    end
  
    def grupo_params
      params.require(:grupo).permit(:nombre)
    end
  end
  