class CursosController < ApplicationController
  before_action :authenticate_profesor! # Asegúrate de que el profesor esté autenticado

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

  private

  def curso_params
    params.require(:curso).permit(:nombre, :sigla)
  end
end
