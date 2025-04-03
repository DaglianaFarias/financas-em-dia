class AdministrativoController < ApplicationController

  def index
    @ultimas_despesas_lancadas = @unidade_familiar.despesas
    @usuarios_ativos = @unidade_familiar&.usuarios.where(status: 'ativo')

    @total_receitas = @usuarios_ativos&.joins(:receitas).sum("receitas.valor")
    @orcamentos = @unidade_familiar.orcamentos&.includes(:despesas)
  end
end