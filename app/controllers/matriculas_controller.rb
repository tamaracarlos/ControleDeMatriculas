class MatriculasController < ApplicationController
  before_action :set_matricula, only: [:show, :edit, :update, :destroy]

 def index
     if params[:search]
     @matriculas = Matricula.search(params[:search])
    else
     @matriculas = Matricula.all
    end
  end

  def show
  end

  def new
    @matricula = Matricula.new
  end

  def edit
  end 

  def create
    @matricula = Matricula.new(matricula_params)

    respond_to do |format|
      if @matricula.save
        format.html { redirect_to @matricula, notice: 'Matrícula criada com sucesso.' }
        format.json { render :show, status: :created, location: @matricula }
      else
        format.html { render :new }
        format.json { render json: @matricula.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @matricula.update(matricula_params)
        format.html { redirect_to @matricula, notice: 'Matrícula atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @matricula }
      else
        format.html { render :edit }
        format.json { render json: @matricula.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @matricula.destroy
    respond_to do |format|
      format.html { redirect_to matriculas_url, notice: 'Matricula excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def set_matricula
      @matricula = Matricula.find(params[:id])
    end

    def matricula_params
      params.require(:matricula).permit(:aluno_id, :curso_id, :data_matricula, :ano, :ativo, :pago)
    end
end
