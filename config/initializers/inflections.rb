ActiveSupport::Inflector.inflections do |inflect|
  inflect.clear

  inflect.plural(/$/,  's')
  inflect.plural(/(s)$/i,  '\1')
  inflect.plural(/^(paí)s$/i, '\1ses')
  inflect.plural(/(z|r)$/i, '\1es')
  inflect.plural(/al$/i,  'ais')
  inflect.plural(/el$/i,  'eis')
  inflect.plural(/ol$/i,  'ois')
  inflect.plural(/ul$/i,  'uis')
  inflect.plural(/([^aeou])il$/i,  '\1is')
  inflect.plural(/m$/i,   'ns')
  inflect.plural(/^(japon|escoc|ingl|dinamarqu|fregu|portugu)ês$/i,  '\1eses')
  inflect.plural(/^(|g)ás$/i,  '\1ases')
  inflect.plural(/ão$/i,  'ões')
  inflect.plural(/^(irm|m)ão$/i,  '\1ãos')
  inflect.plural(/^(alem|c|p)ão$/i,  '\1ães')

  # Sem acentos...
  inflect.plural(/ao$/i,  'oes')
  inflect.plural(/^(irm|m)ao$/i,  '\1aos')
  inflect.plural(/^(alem|c|p)ao$/i,  '\1aes')
  inflect.plural(/^m(ã|a)o$/i, 'm\1os')

  inflect.singular(/([^ê])s$/i, '\1')
  inflect.singular(/^(á|gá|paí)s$/i, '\1s')
  inflect.singular(/(r|z)es$/i, '\1')
  inflect.singular(/([^p])ais$/i, '\1al')
  inflect.singular(/eis$/i, 'el')
  inflect.singular(/ois$/i, 'ol')
  inflect.singular(/uis$/i, 'ul')
  inflect.singular(/(r|t|f|v)is$/i, '\1il')
  inflect.singular(/ns$/i, 'm')
  inflect.singular(/sses$/i, 'sse')
  inflect.singular(/^(.*[^s]s)es$/i, '\1')
  inflect.singular(/ães$/i, 'ão')
  inflect.singular(/aes$/i, 'ao')
  inflect.singular(/ãos$/i, 'ão')
  inflect.singular(/aos$/i, 'ao')
  inflect.singular(/ões$/i, 'ão')
  inflect.singular(/oes$/i, 'ao')
  inflect.singular(/(japon|escoc|ingl|dinamarqu|fregu|portugu)eses$/i, '\1ês')
  inflect.singular(/^(g|)ases$/i,  '\1ás')
  inflect.singular(/^t(ê|e)nis$/i, 't\1nis')
  inflect.singular(/^(ó|o)culos$/i, '\1culos')
  inflect.singular(/^fases$/i, 'fase')
  inflect.singular(/^m(ê|e)s$/i, 'm\1ses')
  inflect.singular(/^l(á|a)pis$/i, 'l\1pis')

  # Incontáveis
  inflect.uncountable %w( tórax tênis ônibus lápis fênix )

  # Irregulares
  inflect.irregular 'país', 'países'
  inflect.irregular 'synonym', 'synonyms'
  inflect.irregular 'area_projeto', 'areas_projetos'
end