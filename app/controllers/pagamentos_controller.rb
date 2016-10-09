class PagamentosController < ApplicationController
  before_action :set_pagamento, only: [:show, :edit, :update, :destroy]

  def index
    @pagamentos = Pagamento.all
  end

  def show
  end

  def new
    @pagamento = Pagamento.new
  end

  def edit
  end

  def create
    @pagamento = Pagamento.new(pagamento_params)

    respond_to do |format|
      if @pagamento.save
        format.html { redirect_to @pagamento, notice: 'Matrícula paga com sucesso.' }
        format.json { render :index, status: :created, location: @pagamento }
      else
        format.html { render :new }
        format.json { render json: @pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pagamento.update(pagamento_params)
        format.html { redirect_to @pagamento, notice: 'Pagamento atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @pagamento }
      else
        format.html { render :edit }
        format.json { render json: @pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pagamento.destroy
    respond_to do |format|
      format.html { redirect_to pagamentos_url, notice: 'Pagamento excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def set_pagamento
      @pagamento = Pagamento.find(params[:id])
    end

    def pagamento_params
      params.require(:pagamento).permit(:troco, :dinheiro, :matricula_id, :curso_id)
    end
end
