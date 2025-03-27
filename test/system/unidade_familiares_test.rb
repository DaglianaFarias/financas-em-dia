require "application_system_test_case"

class UnidadeFamiliaresTest < ApplicationSystemTestCase
  setup do
    @unidade_familiar = unidade_familiares(:one)
  end

  test "visiting the index" do
    visit unidade_familiares_url
    assert_selector "h1", text: "Unidade familiares"
  end

  test "should create unidade familiar" do
    visit unidade_familiares_url
    click_on "New unidade familiar"

    fill_in "Categoria", with: @unidade_familiar.categoria
    fill_in "Descricao", with: @unidade_familiar.descricao
    fill_in "Nome", with: @unidade_familiar.nome
    fill_in "Status", with: @unidade_familiar.status
    click_on "Create Unidade familiar"

    assert_text "Unidade familiar was successfully created"
    click_on "Back"
  end

  test "should update Unidade familiar" do
    visit unidade_familiar_url(@unidade_familiar)
    click_on "Edit this unidade familiar", match: :first

    fill_in "Categoria", with: @unidade_familiar.categoria
    fill_in "Descricao", with: @unidade_familiar.descricao
    fill_in "Nome", with: @unidade_familiar.nome
    fill_in "Status", with: @unidade_familiar.status
    click_on "Update Unidade familiar"

    assert_text "Unidade familiar was successfully updated"
    click_on "Back"
  end

  test "should destroy Unidade familiar" do
    visit unidade_familiar_url(@unidade_familiar)
    click_on "Destroy this unidade familiar", match: :first

    assert_text "Unidade familiar was successfully destroyed"
  end
end
