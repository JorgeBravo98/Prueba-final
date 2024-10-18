class CursosController < ApplicationController
  before_action :authenticate_profesor! # Asegúrate de que el profesor esté autenticado
  before_action :set_curso, only: [:show, :edit, :update, :destroy] # Asegúrate de encontrar el curso correcto para varias acciones
  before_action :authorize_profesor!, only: [:edit, :update, :destroy] # Verifica que el profesor tenga permiso para modificar el curso

  def new
    @curso = Curso.new
    @profesor = current_profesor
  end

  def index
    @cursos = current_profesor.cursos # Obtén los cursos del profesor autenticado
  end

  def create
    @curso = Curso.new(curso_params)
    @curso.profesor = current_profesor # Asignar el profesor en lugar de solo el ID

    if @curso.save
      redirect_to @curso, notice: 'Curso creado exitosamente.'
    else
      render :new
    end
  end

  def show
    @curso = Curso.find(params[:id])
  end

  # Nuevo método edit
  def edit
    @curso = Curso.find(params[:id])
  end

  # Nuevo método update
  def update
    @curso = Curso.find(params[:id])
    if @curso.update(curso_params)
      redirect_to @curso, notice: 'El curso ha sido actualizado correctamente.'
    else
      render :edit
    end
  end

  def destroy
    @curso = Curso.find(params[:id])
    @curso.destroy
    redirect_to cursos_path, notice: 'Curso eliminado exitosamente.'
  end

  def mis_cursos
    @cursos = current_profesor.cursos
  end

  private

  # Nuevo método para encontrar el curso por su ID
  def set_curso
    @curso = Curso.find(params[:id])
  end
  
  

  # Asegurarse de que solo el profesor que creó el curso pueda editarlo
  def authorize_profesor!
    unless @curso.profesor == current_profesor
      redirect_to cursos_path, alert: "No tienes permiso para modificar este curso."
    end
  end

  # Fuerte parámetro para evitar que se puedan cambiar valores no permitidos
  def curso_params
    params.require(:curso).permit(:nombre, :sigla, :descripcion)
  end
  

end
