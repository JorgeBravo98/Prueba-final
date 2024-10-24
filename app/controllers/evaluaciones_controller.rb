class EvaluacionesController < ApplicationController
  before_action :set_curso
  before_action :set_evaluacion, only: [:show, :edit, :update, :calificar]

  def index
    @evaluaciones = @curso.evaluaciones
  end

  def show
    @evaluacion = @curso.evaluaciones.find(params[:id])
  end

  def new
    @evaluacion = @curso.evaluaciones.build
  end

  def create
    #@evaluacion = @curso.evaluaciones.build(evaluacion_params)
    #@evaluacion.alumno_id = current_alumno.id # Asignar el ID del alumno
  
    if @evaluacion.save
      flash[:notice] = 'Evaluación creada exitosamente.'
      redirect_to curso_evaluaciones_path(@curso)
    else
      flash[:alert] = 'No se pudo crear la evaluación.'
      render :new
    end
  end
  

  def edit
  end

  def update
    if @evaluacion.update(evaluacion_params)
      flash[:notice] = 'Evaluación actualizada exitosamente.'
      redirect_to curso_evaluaciones_path(@curso)
    else
      render :edit
    end
  end

  def calificar
    if @evaluacion.update(calificacion_params)
      flash[:notice] = 'Evaluación calificada exitosamente.'
      redirect_to curso_evaluaciones_path(@curso)
    else
      render :show
    end
  end

  private

  def set_curso
    @curso = Curso.find(params[:curso_id])
  end

  def set_evaluacion
    @evaluacion = @curso.evaluaciones.find(params[:id])
  end

  def evaluacion_params
    params.require(:evaluacion).permit(:nombre_evaluacion, :fecha_inicio, :fecha_termino, :alumno_id)
  end

  def calificacion_params
    params.require(:evaluacion).permit(:calificacion)
  end
end
