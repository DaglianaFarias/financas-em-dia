class ApplicationController < ActionController::Base
  before_action :set_unidade_familiar, :set_data_referencia

  private

  def set_unidade_familiar
    # ajustar com base no usuário logado
    @unidade_familiar = UnidadeFamiliar.first
  end

  def set_data_referencia
    # @current_date_referencia = l( Date.today, format: :mes_ano)
    @data_referencia = Date.today
  end
end
