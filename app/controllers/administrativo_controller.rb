class AdministrativoController < ApplicationController

  def index
    @ultimas_despesas_lancadas = @unidade_familiar.despesas.where(categoria: 'gastos').limit(8)
    @ultimas_contas_lancadas = @unidade_familiar.despesas.where(categoria: 'contas').limit(8)
    @usuarios_ativos = @unidade_familiar&.usuarios.where(status: 'ativo')

    @total_receitas = @usuarios_ativos&.joins(:receitas).sum("receitas.valor")
    @orcamentos = @unidade_familiar.orcamentos&.includes(:despesas)
  end
end