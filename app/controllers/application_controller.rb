class ApplicationController < ActionController::Base
  before_action :authenticate_usuario!
  before_action :set_info_usuario, if: :usuario_autenticado?

  def after_sign_in_path_for(resource)
    if resource.administrador?
      area_administrativa_path
    else
      root_path
    end
  end

  private

  def set_info_usuario
    @user_is_admin = current_usuario.administrador?
    @unidade_familiar = current_usuario.unidade_familiar
    @data_referencia = Date.today
  end

  def usuario_autenticado?
    usuario_signed_in?
  end
end
