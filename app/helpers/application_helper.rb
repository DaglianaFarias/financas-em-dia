module ApplicationHelper
  def formatar_data(data, formato: :padrao)
    return '' if data.blank?

    case formato
    when :padrao
      data.strftime("%d/%m/%Y") # Exemplo: 02/04/2025
    when :completo
      data.strftime("%d de %B de %Y") # Exemplo: 2 de abril de 2025
    when :curto
      data.strftime("%d/%m") # Exemplo: 02/04
    when :data_hora
      data.strftime("%d/%m/%Y %H:%M") # Exemplo: 02/04/2025 14:30
    else
      data.to_s
    end
  end
end
