require "test_helper"

class HistoricoPagamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historico_pagamento = historico_pagamentos(:one)
  end

  test "should get index" do
    get historico_pagamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_historico_pagamento_url
    assert_response :success
  end

  test "should create historico_pagamento" do
    assert_difference("HistoricoPagamento.count") do
      post historico_pagamentos_url, params: { historico_pagamento: { data_pagamento: @historico_pagamento.data_pagamento, despesa_id: @historico_pagamento.despesa_id } }
    end

    assert_redirected_to historico_pagamento_url(HistoricoPagamento.last)
  end

  test "should show historico_pagamento" do
    get historico_pagamento_url(@historico_pagamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_historico_pagamento_url(@historico_pagamento)
    assert_response :success
  end

  test "should update historico_pagamento" do
    patch historico_pagamento_url(@historico_pagamento), params: { historico_pagamento: { data_pagamento: @historico_pagamento.data_pagamento, despesa_id: @historico_pagamento.despesa_id } }
    assert_redirected_to historico_pagamento_url(@historico_pagamento)
  end

  test "should destroy historico_pagamento" do
    assert_difference("HistoricoPagamento.count", -1) do
      delete historico_pagamento_url(@historico_pagamento)
    end

    assert_redirected_to historico_pagamentos_url
  end
end
