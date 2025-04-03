module FormaPagamentosHelper

  def formas_de_pagamento
    usuarios = @unidade_familiar.usuarios.includes(:forma_pagamentos)
  
    meios_de_pagamento = []
    usuarios.each do |usuario|
      usuario.forma_pagamentos.each do |forma_pagamento|
        meios_de_pagamento << [ "#{forma_pagamento.nome} | #{t("attributes.forma_pagamento_tipos.#{forma_pagamento.tipo}")}", forma_pagamento.id ]
      end
    end
  
    meios_de_pagamento
  end

  def formatar_nome_e_tipo_pagamento(forma_pagamento)
    "#{forma_pagamento.nome} | #{t("attributes.forma_pagamento_tipos.#{forma_pagamento.tipo}")}"
  end
end
