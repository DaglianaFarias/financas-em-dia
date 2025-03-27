class UnidadeFamiliaresController < ApplicationController
  before_action :set_unidade_familiar, only: %i[ show edit update destroy ]

  # GET /unidade_familiares or /unidade_familiares.json
  def index
    @unidade_familiares = UnidadeFamiliar.all
  end

  # GET /unidade_familiares/1 or /unidade_familiares/1.json
  def show
  end

  # GET /unidade_familiares/new
  def new
    @unidade_familiar = UnidadeFamiliar.new
  end

  # GET /unidade_familiares/1/edit
  def edit
  end

  # POST /unidade_familiares or /unidade_familiares.json
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

  # PATCH/PUT /unidade_familiares/1 or /unidade_familiares/1.json
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

  # DELETE /unidade_familiares/1 or /unidade_familiares/1.json
  def destroy
    @unidade_familiar.destroy!

    respond_to do |format|
      format.html { redirect_to unidade_familiares_path, status: :see_other, notice: "Unidade familiar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidade_familiar
      @unidade_familiar = UnidadeFamiliar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unidade_familiar_params
      params.require(:unidade_familiar).permit(:nome, :descricao, :status, :categoria)
    end
end
