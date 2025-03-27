require "test_helper"

class UnidadeFamiliaresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unidade_familiar = unidade_familiares(:one)
  end

  test "should get index" do
    get unidade_familiares_url
    assert_response :success
  end

  test "should get new" do
    get new_unidade_familiar_url
    assert_response :success
  end

  test "should create unidade_familiar" do
    assert_difference("UnidadeFamiliar.count") do
      post unidade_familiares_url, params: { unidade_familiar: { categoria: @unidade_familiar.categoria, descricao: @unidade_familiar.descricao, nome: @unidade_familiar.nome, status: @unidade_familiar.status } }
    end

    assert_redirected_to unidade_familiar_url(UnidadeFamiliar.last)
  end

  test "should show unidade_familiar" do
    get unidade_familiar_url(@unidade_familiar)
    assert_response :success
  end

  test "should get edit" do
    get edit_unidade_familiar_url(@unidade_familiar)
    assert_response :success
  end

  test "should update unidade_familiar" do
    patch unidade_familiar_url(@unidade_familiar), params: { unidade_familiar: { categoria: @unidade_familiar.categoria, descricao: @unidade_familiar.descricao, nome: @unidade_familiar.nome, status: @unidade_familiar.status } }
    assert_redirected_to unidade_familiar_url(@unidade_familiar)
  end

  test "should destroy unidade_familiar" do
    assert_difference("UnidadeFamiliar.count", -1) do
      delete unidade_familiar_url(@unidade_familiar)
    end

    assert_redirected_to unidade_familiares_url
  end
end
