class UsuariosController < ApplicationController
  before_action :set_usuario, only: %i[ show edit update destroy ]

  def index
    @usuarios = @unidade_familiar.usuarios
    @receita = Receita.new
  end

  def show
  end

  def new
    @usuario = Usuario.new(unidade_familiar_id: params[:unidade_familiar_id], perfil: 'usuario_regular')
  end

  def edit
    @usuario.unidade_familiar_id = params[:unidade_familiar_id] if current_usuario.administrador?
  end

  def create
    @usuario = Usuario.new(usuario_params)
    @usuario.unidade_familiar = @unidade_familiar unless current_usuario.administrador?

    if @usuario.save
      redirect_to @usuario, notice: "Usuário cadastrado com sucesso."
    else
      render :new
    end
  end

  def update
    if @usuario.update(usuario_params)
      redirect_to @usuario, notice: "Usuário atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @usuario.destroy!
      if current_usuario.administrador?
        redirect_to unidade_familiar_path(@usuario.unidade_familiar), status: :see_other, notice: "Usuário excluído com sucesso!"
      else
        redirect_to usuarios_path, status: :see_other, notice: "Usuário excluído com sucesso!"
      end
    end
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  def usuario_params
    params.require(:usuario).permit(:unidade_familiar_id, :nome, :email, :password, :password_confirmation, :status, :perfil, :receber_alerta)
  end
end
