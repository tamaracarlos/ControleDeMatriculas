require 'test_helper'

class BuscasControllerTest < ActionController::TestCase
  setup do
    @busca = buscas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buscas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create busca" do
    assert_difference('Busca.count') do
      post :create, busca: { aluno_id: @busca.aluno_id, curso_id: @busca.curso_id, matricula_id: @busca.matricula_id }
    end

    assert_redirected_to busca_path(assigns(:busca))
  end

  test "should show busca" do
    get :show, id: @busca
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @busca
    assert_response :success
  end

  test "should update busca" do
    patch :update, id: @busca, busca: { aluno_id: @busca.aluno_id, curso_id: @busca.curso_id, matricula_id: @busca.matricula_id }
    assert_redirected_to busca_path(assigns(:busca))
  end

  test "should destroy busca" do
    assert_difference('Busca.count', -1) do
      delete :destroy, id: @busca
    end

    assert_redirected_to buscas_path
  end
end
