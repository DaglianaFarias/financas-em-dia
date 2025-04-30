class OrcamentosController < ApplicationController
  before_action :set_orcamento, only: %i[ show edit update destroy ]

  def index
    @orcamentos = @unidade_familiar.orcamentos
  end

  def show
  end

  def new
    @orcamento = Orcamento.new(unidade_familiar: @unidade_familiar)
  end

  def edit
  end

  def create
    @orcamento = Orcamento.new(orcamento_params)
    @orcamento.unidade_familiar = @unidade_familiar

    if @orcamento.save
      redirect_to orcamentos_path, notice: 'Orçamento criado com sucesso.'
    else
      render :new
    end
  end

  def update
    if @orcamento.update(orcamento_params)
      redirect_to orcamentos_path, notice: 'Orçamento atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @orcamento.destroy!

    respond_to do |format|
      format.html { redirect_to orcamentos_path, status: :see_other, notice: "Orcamento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def despesas_agrupadas
    @despesas_orcamentos = @unidade_familiar.orcamentos.order(:categoria).includes(:despesas)
    @compras_parceladas = @unidade_familiar.despesas.where(categoria: 'parcelas')
  end

  private
    def set_orcamento
      @orcamento = Orcamento.find(params[:id])
    end

    def orcamento_params
      params.require(:orcamento).permit(:unidade_familiar_id, :categoria, :status, :descricao, :valorEstimado)
    end
end
