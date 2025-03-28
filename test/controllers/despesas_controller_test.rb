require "test_helper"

class DespesasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @despesa = despesas(:one)
  end

  test "should get index" do
    get despesas_url
    assert_response :success
  end

  test "should get new" do
    get new_despesa_url
    assert_response :success
  end

  test "should create despesa" do
    assert_difference("Despesa.count") do
      post despesas_url, params: { despesa: { alertar_vencimento: @despesa.alertar_vencimento, categoria: @despesa.categoria, data_gasto: @despesa.data_gasto, data_vencimento: @despesa.data_vencimento, descricao: @despesa.descricao, dia_vencimento: @despesa.dia_vencimento, forma_pagamento_id: @despesa.forma_pagamento_id, orcamento_id: @despesa.orcamento_id, parcela_atual: @despesa.parcela_atual, quantidade_parcelas: @despesa.quantidade_parcelas, status: @despesa.status, valor: @despesa.valor } }
    end

    assert_redirected_to despesa_url(Despesa.last)
  end

  test "should show despesa" do
    get despesa_url(@despesa)
    assert_response :success
  end

  test "should get edit" do
    get edit_despesa_url(@despesa)
    assert_response :success
  end

  test "should update despesa" do
    patch despesa_url(@despesa), params: { despesa: { alertar_vencimento: @despesa.alertar_vencimento, categoria: @despesa.categoria, data_gasto: @despesa.data_gasto, data_vencimento: @despesa.data_vencimento, descricao: @despesa.descricao, dia_vencimento: @despesa.dia_vencimento, forma_pagamento_id: @despesa.forma_pagamento_id, orcamento_id: @despesa.orcamento_id, parcela_atual: @despesa.parcela_atual, quantidade_parcelas: @despesa.quantidade_parcelas, status: @despesa.status, valor: @despesa.valor } }
    assert_redirected_to despesa_url(@despesa)
  end

  test "should destroy despesa" do
    assert_difference("Despesa.count", -1) do
      delete despesa_url(@despesa)
    end

    assert_redirected_to despesas_url
  end
end
