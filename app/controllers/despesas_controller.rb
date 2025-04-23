class DespesasController < ApplicationController
  before_action :set_despesa, only: %i[ show edit update destroy pagamento_despesa]

  def index
    @despesas = Despesa.all
  end

  def show
  end

  def new
    @despesa = Despesa.new
    @despesa.categoria = params[:categoria].present? ? params[:categoria] : 'gastos'
  end

  def edit
  end

  def create
    @despesa = Despesa.new(despesa_params)
    @despesa.unidade_familiar = @unidade_familiar
    @despesa.categoria = 'gastos' if despesa_params[:categoria].blank?

    respond_to do |format|
      if @despesa.save
        format.html { redirect_to @despesa, notice: "Despesa was successfully created." }
        format.json { render :show, status: :created, location: @despesa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @despesa.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @despesa.update(despesa_params)
        format.html { redirect_to @despesa, notice: "Despesa was successfully updated." }
        format.json { render :show, status: :ok, location: @despesa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @despesa.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @despesa.destroy!

    respond_to do |format|
      format.html { redirect_to despesas_path, status: :see_other, notice: "Despesa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def new_conta
    @despesa = Despesa.new(categoria: 'contas')
  end

  def save_conta
    @conta = Despesa.new(despesa_params)
    @conta.unidade_familiar = @unidade_familiar
    @conta.categoria = 'contas'

    if @conta.save
      redirect_to listar_contas_path, notice: "Conta cadastrada com sucesso"
    else
      render :new_conta
    end
  end

  def listar_contas
    @contas =  Despesa.where(categoria: 'contas').order(dia_vencimento: :asc)
  end

  def pagamento_despesa
    data_referencia = params[:data]
    @despesa.historico_pagamentos.create!(data_pagamento: data_referencia)

    redirect_to root_path
  end

  private

  def set_despesa
    @despesa = Despesa.find(params[:id])
  end

  def despesa_params
    params.require(:despesa).permit(:orcamento_id, :forma_pagamento_id, :descricao, :categoria, :data_gasto, :valor, :status, :quantidade_parcelas, :parcela_atual, :dia_vencimento, :data_vencimento, :alertar_vencimento)
  end
end
