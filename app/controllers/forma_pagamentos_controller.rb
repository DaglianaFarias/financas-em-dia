class FormaPagamentosController < ApplicationController
  before_action :set_forma_pagamento, only: %i[ show edit update destroy ]

  def index
    @forma_pagamentos = FormaPagamento.all
  end

  def show
  end

  def new
    @forma_pagamento = FormaPagamento.new
  end

  def edit
  end

  def create
    @forma_pagamento = FormaPagamento.new(forma_pagamento_params)

    respond_to do |format|
      if @forma_pagamento.save
        format.html { redirect_to usuario_path(@forma_pagamento.usuario_id), notice: "Forma de pagamento cadastrada com sucesso!" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @forma_pagamento.update(forma_pagamento_params)
        format.html { redirect_to usuario_path(@forma_pagamento.usuario_id), notice: "Forma de pagamento atualizada com sucesso." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @forma_pagamento.destroy!

    respond_to do |format|
      format.html { redirect_to forma_pagamentos_path, status: :see_other, notice: "Forma pagamento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_forma_pagamento
      @forma_pagamento = FormaPagamento.find(params[:id])
    end

    def forma_pagamento_params
      params.require(:forma_pagamento).permit(:usuario_id, :nome, :descricao, :tipo, :dia_vencimento_fatura, :melhor_dia_compra, :status, :categoria)
    end
end
