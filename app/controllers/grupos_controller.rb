class GruposController < ApplicationController
  before_action :set_curso
  before_action :set_grupo, only: [:edit, :update, :destroy]

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

  def edit
    @grupo = @curso.grupos.find(params[:id])
    @alumnos = Alumno.all # Cargar todos los alumnos para mostrarlos en el formulario
  end
  

  def show
    @grupo = @curso.grupos.find(params[:id])
  end
  

  def update
    if @grupo.update(grupo_params)
      redirect_to curso_grupos_path(@curso), notice: 'Grupo actualizado exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @grupo = @curso.grupos.find(params[:id])
    
    if @grupo.destroy
      redirect_to curso_grupos_path(@curso), notice: 'Grupo eliminado exitosamente.'
    else
      redirect_to curso_grupos_path(@curso), alert: 'Hubo un error al eliminar el grupo.'
    end
  end
  
  

  private

  def set_curso
    @curso = Curso.find(params[:curso_id])
  end

  def set_grupo
    @grupo = @curso.grupos.find(params[:id])
  end

  def grupo_params
    params.require(:grupo).permit(:nombre, alumno_ids: [])
  end
end
