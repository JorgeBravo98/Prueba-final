class AnunciosController < ApplicationController
  before_action :set_curso
  before_action :set_anuncio, only: [:show, :destroy]

  def index
    @anuncios = @curso.anuncios
  end

  def show
    # El anuncio ya está configurado por el before_action
  end

  def new
    @anuncio = @curso.anuncios.build
  end

  def create
    logger.debug "Curso ID: #{@curso.id}, Profesor ID: #{current_profesor.id}"
  
    @anuncio = @curso.anuncios.build(anuncio_params)
    @anuncio.profesor_id = current_profesor.id # Asigna el profesor actual al anuncio
  
    if @anuncio.save
      redirect_to curso_anuncios_path(@curso), notice: 'Anuncio creado exitosamente.'
    else
      Rails.logger.debug(@anuncio.errors.full_messages) # Para mostrar mensajes de error en consola
      render :new
    end
  end

  def destroy
    @anuncio.destroy
    redirect_to curso_anuncios_path(@curso), notice: 'Anuncio eliminado exitosamente.'
  end
  
  
  
  

  private

  def set_curso
    @curso = Curso.find(params[:curso_id])
  end

  def set_anuncio
    @anuncio = @curso.anuncios.find(params[:id])
  end

  def anuncio_params
    params.require(:anuncio).permit(:titulo, :contenido)
  end
end
