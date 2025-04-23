module FormaPagamentosHelper

  def formas_de_pagamento
    @unidade_familiar.usuarios.includes(:forma_pagamentos).each_with_object({}) do |usuario, hash|
      opcoes = usuario.forma_pagamentos.map do |fp|
        ["#{fp.nome} | #{I18n.t("attributes.forma_pagamento_tipos.#{fp.tipo}")}", fp.id]
      end
      hash[usuario.nome] = opcoes
    end
  end

  def formatar_nome_e_tipo_pagamento(forma_pagamento)
    "#{forma_pagamento.nome} | #{t("attributes.forma_pagamento_tipos.#{forma_pagamento.tipo}")}"
  end
end
