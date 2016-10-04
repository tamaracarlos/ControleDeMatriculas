class CursosController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy]

  def index
     if params[:search]
     @cursos = Curso.search(params[:search])
    else
     @cursos = Curso.all
    end
  end

  def show
  end

  def new
    @curso = Curso.new
  end

  def edit
  end

  def create
    @curso = Curso.new(curso_params)

    respond_to do |format|
      if @curso.save
        format.html { redirect_to @curso, notice: 'Curso criado com sucesso.' }
        format.json { render :show, status: :created, location: @curso }
      else
        format.html { render :new }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @curso.update(curso_params)
        format.html { redirect_to @curso, notice: 'Curso atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @curso }
      else
        format.html { render :edit }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @curso.destroy
    respond_to do |format|
      format.html { redirect_to cursos_url, notice: 'Curso excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private 
    def set_curso
      @curso = Curso.find(params[:id])
    end

    def curso_params
      params.require(:curso).permit(:nome, :valor_inscricao, :periodo)
    end
end
