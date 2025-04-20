require "application_system_test_case"

class FormaPagamentosTest < ApplicationSystemTestCase
  setup do
    @forma_pagamento = forma_pagamentos(:one)
  end

  test "visiting the index" do
    visit forma_pagamentos_url
    assert_selector "h1", text: "Forma pagamentos"
  end

  test "should create forma pagamento" do
    visit forma_pagamentos_url
    click_on "New forma pagamento"

    fill_in "Categoria", with: @forma_pagamento.categoria
    fill_in "Descricao", with: @forma_pagamento.descricao
    fill_in "Fechamento fatura", with: @forma_pagamento.fechamento_fatura
    fill_in "Nome", with: @forma_pagamento.nome
    fill_in "Status", with: @forma_pagamento.status
    fill_in "Tipo", with: @forma_pagamento.tipo
    fill_in "Usuario", with: @forma_pagamento.usuario_id
    fill_in "Vencimento fatura", with: @forma_pagamento.vencimento_fatura
    click_on "Create Forma pagamento"

    assert_text "Forma pagamento was successfully created"
    click_on "Back"
  end

  test "should update Forma pagamento" do
    visit forma_pagamento_url(@forma_pagamento)
    click_on "Edit this forma pagamento", match: :first

    fill_in "Categoria", with: @forma_pagamento.categoria
    fill_in "Descricao", with: @forma_pagamento.descricao
    fill_in "Fechamento fatura", with: @forma_pagamento.fechamento_fatura
    fill_in "Nome", with: @forma_pagamento.nome
    fill_in "Status", with: @forma_pagamento.status
    fill_in "Tipo", with: @forma_pagamento.tipo
    fill_in "Usuario", with: @forma_pagamento.usuario_id
    fill_in "Vencimento fatura", with: @forma_pagamento.vencimento_fatura
    click_on "Update Forma pagamento"

    assert_text "Forma pagamento was successfully updated"
    click_on "Back"
  end

  test "should destroy Forma pagamento" do
    visit forma_pagamento_url(@forma_pagamento)
    click_on "Destroy this forma pagamento", match: :first

    assert_text "Forma pagamento was successfully destroyed"
  end
end
