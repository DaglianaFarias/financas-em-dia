module FormaPagamentosHelper

  def formas_de_pagamento
    @unidade_familiar.usuarios.includes(:forma_pagamentos).each_with_object({}) do |usuario, formas_de_pagamento_por_usuario|
      opcoes = usuario.forma_pagamentos.map do |forma_pagamento|
        [
          "#{forma_pagamento.nome} | #{I18n.t("attributes.forma_pagamento_tipos.#{forma_pagamento.tipo}")}",
          forma_pagamento.id
        ]
      end
      formas_de_pagamento_por_usuario[usuario.nome] = opcoes
    end
  end

  def formatar_nome_e_tipo_pagamento(forma_pagamento)
    "#{forma_pagamento.nome} | #{t("attributes.forma_pagamento_tipos.#{forma_pagamento.tipo}")}"
  end
end
