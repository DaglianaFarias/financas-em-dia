class HistoricoPagamentosController < ApplicationController
  before_action :set_historico_pagamento, only: %i[ show edit update destroy ]

  def index
    @historico_pagamentos = HistoricoPagamento.all
  end

  def show
  end

  def new
    @historico_pagamento = HistoricoPagamento.new
  end

  def create
    @historico_pagamento = HistoricoPagamento.new(historico_pagamento_params)

    respond_to do |format|
      if @historico_pagamento.save
        format.html { redirect_to @historico_pagamento, notice: "Historico pagamento was successfully created." }
        format.json { render :show, status: :created, location: @historico_pagamento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @historico_pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @historico_pagamento.destroy!

    respond_to do |format|
      format.html { redirect_to historico_pagamentos_path, status: :see_other, notice: "Historico pagamento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_historico_pagamento
      @historico_pagamento = HistoricoPagamento.find(params[:id])
    end

    def historico_pagamento_params
      params.require(:historico_pagamento).permit(:despesa_id, :data_pagamento)
    end
end
