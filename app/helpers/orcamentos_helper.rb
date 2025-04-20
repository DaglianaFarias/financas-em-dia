module OrcamentosHelper

  def descricao_orcamentos
    @unidade_familiar.orcamentos.pluck(:categoria, :id)
  end
end
