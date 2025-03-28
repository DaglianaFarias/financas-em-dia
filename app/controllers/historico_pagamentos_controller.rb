class HistoricoPagamentosController < ApplicationController
  before_action :set_historico_pagamento, only: %i[ show edit update destroy ]

  # GET /historico_pagamentos or /historico_pagamentos.json
  def index
    @historico_pagamentos = HistoricoPagamento.all
  end

  # GET /historico_pagamentos/1 or /historico_pagamentos/1.json
  def show
  end

  # GET /historico_pagamentos/new
  def new
    @historico_pagamento = HistoricoPagamento.new
  end

  # GET /historico_pagamentos/1/edit
  def edit
  end

  # POST /historico_pagamentos or /historico_pagamentos.json
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

  # PATCH/PUT /historico_pagamentos/1 or /historico_pagamentos/1.json
  def update
    respond_to do |format|
      if @historico_pagamento.update(historico_pagamento_params)
        format.html { redirect_to @historico_pagamento, notice: "Historico pagamento was successfully updated." }
        format.json { render :show, status: :ok, location: @historico_pagamento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @historico_pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historico_pagamentos/1 or /historico_pagamentos/1.json
  def destroy
    @historico_pagamento.destroy!

    respond_to do |format|
      format.html { redirect_to historico_pagamentos_path, status: :see_other, notice: "Historico pagamento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historico_pagamento
      @historico_pagamento = HistoricoPagamento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def historico_pagamento_params
      params.require(:historico_pagamento).permit(:despesa_id, :data_pagamento)
    end
end
