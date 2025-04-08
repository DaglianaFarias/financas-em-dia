class ReceitasController < ApplicationController
  before_action :set_receita, only: %i[ show edit update destroy ]

  def index
    @receitas = Receita.all
  end

  def show
  end

  def new
    @receita = Receita.new
  end

  def edit
  end

  def create
    @receita = Receita.new(receita_params)

    respond_to do |format|
      if @receita.save
        format.html { redirect_to usuario_path(@receita.usuario_id), notice: "Receita criada com sucesso.." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @receita.update(receita_params)
        format.html { redirect_to usuario_path(@receita.usuario_id), notice: "Receita atualizada com sucesso." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @receita.destroy!

    respond_to do |format|
      format.html { redirect_to receitas_path, status: :see_other, notice: "Receita was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_receita
      @receita = Receita.find(params[:id])
    end

    def receita_params
      params.require(:receita).permit(:usuario_id, :valor, :descricao, :dataEntrada, :dataEncerramento)
    end
end
