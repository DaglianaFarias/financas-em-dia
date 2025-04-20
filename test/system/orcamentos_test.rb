require "application_system_test_case"

class OrcamentosTest < ApplicationSystemTestCase
  setup do
    @orcamento = orcamentos(:one)
  end

  test "visiting the index" do
    visit orcamentos_url
    assert_selector "h1", text: "Orcamentos"
  end

  test "should create orcamento" do
    visit orcamentos_url
    click_on "New orcamento"

    fill_in "Categoria", with: @orcamento.categoria
    fill_in "Descricao", with: @orcamento.descricao
    fill_in "Status", with: @orcamento.status
    fill_in "Unidade familiar", with: @orcamento.unidade_familiar_id
    fill_in "Valorestimado", with: @orcamento.valorEstimado
    click_on "Create Orcamento"

    assert_text "Orcamento was successfully created"
    click_on "Back"
  end

  test "should update Orcamento" do
    visit orcamento_url(@orcamento)
    click_on "Edit this orcamento", match: :first

    fill_in "Categoria", with: @orcamento.categoria
    fill_in "Descricao", with: @orcamento.descricao
    fill_in "Status", with: @orcamento.status
    fill_in "Unidade familiar", with: @orcamento.unidade_familiar_id
    fill_in "Valorestimado", with: @orcamento.valorEstimado
    click_on "Update Orcamento"

    assert_text "Orcamento was successfully updated"
    click_on "Back"
  end

  test "should destroy Orcamento" do
    visit orcamento_url(@orcamento)
    click_on "Destroy this orcamento", match: :first

    assert_text "Orcamento was successfully destroyed"
  end
end
