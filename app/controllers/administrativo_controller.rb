class AdministrativoController < ApplicationController

  def index
    @ultimas_despesas_lancadas = @unidade_familiar.despesas
  end
end