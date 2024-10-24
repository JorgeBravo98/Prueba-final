class EvaluacionesController < ApplicationController
  before_action :set_curso
  before_action :set_evaluacion, only: [:show, :edit, :update, :calificar, :destroy]

  def index
    @evaluaciones = @curso.evaluaciones
  end
  
  def destroy
    @evaluacion.destroy
    flash[:notice] = 'La evaluación ha sido eliminada correctamente.'
    redirect_to curso_evaluaciones_path(@curso)
  end

  def show
    @evaluacion = @curso.evaluaciones.find(params[:id])
  end

  def new
    @evaluacion = @curso.evaluaciones.build
  end

  def create
    @curso = Curso.find(params[:curso_id]) 
    @evaluacion = @curso.evaluaciones.build(evaluacion_params)
  
    #Temporalmente asignar un alumno genérico o dejar este valor como nulo
    @evaluacion.alumno_id = Alumno.first.id if Alumno.exists? # O asignar un ID de alumno que exista
  
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
    @evaluacion = @curso.evaluaciones.find(params[:id])
  
    # Debug para ver los parámetros que se están enviando
    Rails.logger.debug "PARAMS: #{params.inspect}"
  
    # Solo procedemos a actualizar si el parámetro calificacion está presente
    if params[:evaluacion] && params[:evaluacion][:calificacion].present?
      if @evaluacion.update(calificacion_params)
        flash[:notice] = 'Calificación guardada exitosamente.'
        redirect_to curso_evaluaciones_path(@curso)
      else
        flash[:alert] = 'No se pudo guardar la calificación.'
        render :calificar
      end
    else
      flash[:alert] = 'Falta la calificación. Por favor, ingrese una calificación.'
      render :calificar
    end
  end
  
  
  

  private

  def calificacion_params
    params.require(:evaluacion).permit(:calificacion)
  end

  def set_curso
    @curso = Curso.find(params[:curso_id])
  end

  def set_evaluacion
    @evaluacion = @curso.evaluaciones.find(params[:id])
  end

  def evaluacion_params
    params.require(:evaluacion).permit(:nombre_evaluacion, :fecha_inicio, :fecha_termino)
  end
end
