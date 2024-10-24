class ArchivosController < ApplicationController
  before_action :set_curso
  before_action :set_archivo, only: [:destroy]

  def index
    @archivos = @curso.archivos
  end

  def new
    @archivo = @curso.archivos.build
  end

  def create
    @archivo = @curso.archivos.build(archivo_params)
    if @archivo.save
      flash[:notice] = 'Archivo subido correctamente.'
      redirect_to curso_archivos_path(@curso)
    else
      flash[:alert] = 'No se pudo subir el archivo.'
      render :new
    end
  end

  # Acción para eliminar archivos
  def destroy
    if @archivo.destroy
      flash[:notice] = 'Archivo eliminado correctamente.'
    else
      flash[:alert] = 'No se pudo eliminar el archivo.'
    end
    redirect_to curso_archivos_path(@curso)
  end

  private

  def set_curso
    @curso = Curso.find(params[:curso_id])
  end

  def set_archivo
    @archivo = @curso.archivos.find(params[:id])
  end

  def archivo_params
    params.require(:archivo).permit(:nombre, :file)
  end
end
