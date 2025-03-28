require "application_system_test_case"

class HistoricoPagamentosTest < ApplicationSystemTestCase
  setup do
    @historico_pagamento = historico_pagamentos(:one)
  end

  test "visiting the index" do
    visit historico_pagamentos_url
    assert_selector "h1", text: "Historico pagamentos"
  end

  test "should create historico pagamento" do
    visit historico_pagamentos_url
    click_on "New historico pagamento"

    fill_in "Data pagamento", with: @historico_pagamento.data_pagamento
    fill_in "Despesa", with: @historico_pagamento.despesa_id
    click_on "Create Historico pagamento"

    assert_text "Historico pagamento was successfully created"
    click_on "Back"
  end

  test "should update Historico pagamento" do
    visit historico_pagamento_url(@historico_pagamento)
    click_on "Edit this historico pagamento", match: :first

    fill_in "Data pagamento", with: @historico_pagamento.data_pagamento
    fill_in "Despesa", with: @historico_pagamento.despesa_id
    click_on "Update Historico pagamento"

    assert_text "Historico pagamento was successfully updated"
    click_on "Back"
  end

  test "should destroy Historico pagamento" do
    visit historico_pagamento_url(@historico_pagamento)
    click_on "Destroy this historico pagamento", match: :first

    assert_text "Historico pagamento was successfully destroyed"
  end
end
