class ApplicationController < ActionController::Base
  before_action :set_unidade_familiar, :set_data_referencia

  private

  def set_unidade_familiar
    @unidade_familiar = UnidadeFamiliar.first
  end

  def set_data_referencia
    @data_referencia = Date.today
  end
end
