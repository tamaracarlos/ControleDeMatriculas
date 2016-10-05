class BuscasController < ApplicationController
  before_action :set_busca, only: [:show, :edit, :update, :destroy]

  def index
    @q = Matricula.ransack(params[:q])
    @matriculas = @q.result.includes(:aluno, :curso)
  end

  
  private
    def set_busca
      @busca = Busca.find(params[:id])
    end

    def busca_params
      params.require(:busca).permit(:aluno_id, :curso_id, :matricula_id)
    end
end
