class ApplicationController < ActionController::Base
  before_action :set_unidade_familiar

  private

  def set_unidade_familiar
    # ajustar com base no usuário logado
    @unidade_familiar = UnidadeFamiliar.first
  end
end
