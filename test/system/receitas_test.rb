require "application_system_test_case"

class ReceitasTest < ApplicationSystemTestCase
  setup do
    @receita = receitas(:one)
  end

  test "visiting the index" do
    visit receitas_url
    assert_selector "h1", text: "Receitas"
  end

  test "should create receita" do
    visit receitas_url
    click_on "New receita"

    fill_in "Dataencerramento", with: @receita.dataEncerramento
    fill_in "Dataentrada", with: @receita.dataEntrada
    fill_in "Descricao", with: @receita.descricao
    fill_in "Usuario", with: @receita.usuario_id
    fill_in "Valor", with: @receita.valor
    click_on "Create Receita"

    assert_text "Receita was successfully created"
    click_on "Back"
  end

  test "should update Receita" do
    visit receita_url(@receita)
    click_on "Edit this receita", match: :first

    fill_in "Dataencerramento", with: @receita.dataEncerramento
    fill_in "Dataentrada", with: @receita.dataEntrada
    fill_in "Descricao", with: @receita.descricao
    fill_in "Usuario", with: @receita.usuario_id
    fill_in "Valor", with: @receita.valor
    click_on "Update Receita"

    assert_text "Receita was successfully updated"
    click_on "Back"
  end

  test "should destroy Receita" do
    visit receita_url(@receita)
    click_on "Destroy this receita", match: :first

    assert_text "Receita was successfully destroyed"
  end
end
