class UnidadeFamiliaresController < ApplicationController
  before_action :set_unidade_familiar, only: %i[ show edit update destroy ]

  def index
    @unidade_familiares = UnidadeFamiliar.all
  end

  def show
    @usuarios = @unidade_familiar.usuarios
  end

  def new
    @unidade_familiar = UnidadeFamiliar.new(status: 'ativa')
  end

  def edit
  end

  def create
    @unidade_familiar = UnidadeFamiliar.new(unidade_familiar_params)

    respond_to do |format|
      if @unidade_familiar.save
        format.html { redirect_to @unidade_familiar, notice: "Unidade familiar was successfully created." }
        format.json { render :show, status: :created, location: @unidade_familiar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @unidade_familiar.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @unidade_familiar.update(unidade_familiar_params)
        format.html { redirect_to @unidade_familiar, notice: "Unidade familiar was successfully updated." }
        format.json { render :show, status: :ok, location: @unidade_familiar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @unidade_familiar.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @unidade_familiar.destroy!

    respond_to do |format|
      format.html { redirect_to unidade_familiares_path, status: :see_other, notice: "Unidade familiar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_unidade_familiar
      @unidade_familiar = UnidadeFamiliar.find(params[:id])
    end

    def unidade_familiar_params
      params.require(:unidade_familiar).permit(:nome, :descricao, :status)
    end
end
