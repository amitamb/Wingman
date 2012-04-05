require 'test_helper'

class SharagesControllerTest < ActionController::TestCase
  setup do
    @sharage = sharages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sharages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sharage" do
    assert_difference('Sharage.count') do
      post :create, sharage: @sharage.attributes
    end

    assert_redirected_to sharage_path(assigns(:sharage))
  end

  test "should show sharage" do
    get :show, id: @sharage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sharage
    assert_response :success
  end

  test "should update sharage" do
    put :update, id: @sharage, sharage: @sharage.attributes
    assert_redirected_to sharage_path(assigns(:sharage))
  end

  test "should destroy sharage" do
    assert_difference('Sharage.count', -1) do
      delete :destroy, id: @sharage
    end

    assert_redirected_to sharages_path
  end
end
