class AlunosController < ApplicationController
  before_action :set_aluno, only: [:show, :edit, :update, :destroy]

  def index
     if params[:busca]
     @alunos = Aluno.busca(params[:busca])
    else
     @alunos = Aluno.all
    end
  end

  def show
  end

  def new
    @aluno = Aluno.new
  end

  def edit
  end

  def create
    @aluno = Aluno.new(aluno_params)

    respond_to do |format|
      if @aluno.save
        format.html { redirect_to @aluno, notice: 'Aluno criado com sucesso.' }
        format.json { render :show, status: :created, location: @aluno }
      else
        format.html { render :new }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @aluno.update(aluno_params)
        format.html { redirect_to @aluno, notice: 'Aluno atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @aluno }
      else
        format.html { render :edit }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @aluno.destroy
    respond_to do |format|
      format.html { redirect_to alunos_url, notice: 'Aluno excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private 
    def set_aluno
      @aluno = Aluno.find(params[:id])
    end
    
    def aluno_params
      params.require(:aluno).permit(:cpf, :rg, :data_nascimento, :nome, :telefone)
    end
end
