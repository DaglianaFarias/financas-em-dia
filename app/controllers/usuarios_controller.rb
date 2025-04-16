class UsuariosController < ApplicationController
  before_action :set_usuario, only: %i[ show edit update destroy ]

  def index
    @usuarios = @unidade_familiar.usuarios
    @receita = Receita.new
  end

  def show
  end

  def new
    @usuario = Usuario.new(unidade_familiar: @unidade_familiar, perfil: 'usuario_regular')
  end

  def edit
  end

  def create
    @usuario = Usuario.new(usuario_params)
    @usuario.unidade_familiar = @unidade_familiar

    if @usuario.save
      redirect_to @usuario, notice: "Usuário cadastrado com sucesso." 
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: "Usuario was successfully updated." }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @usuario.destroy!

    respond_to do |format|
      format.html { redirect_to usuarios_path, status: :see_other, notice: "Usuario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    def usuario_params
      params.require(:usuario).permit(:unidade_familiar_id, :nome, :email, :senha, :status, :perfil, :receber_alerta)
    end
end
