require 'test_helper'

class RecurrentPaymentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recurrent_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recurrent_payment" do
    assert_difference('RecurrentPayment.count') do
      post :create, :recurrent_payment => { }
    end

    assert_redirected_to recurrent_payment_path(assigns(:recurrent_payment))
  end

  test "should show recurrent_payment" do
    get :show, :id => recurrent_payments(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => recurrent_payments(:one).id
    assert_response :success
  end

  test "should update recurrent_payment" do
    put :update, :id => recurrent_payments(:one).id, :recurrent_payment => { }
    assert_redirected_to recurrent_payment_path(assigns(:recurrent_payment))
  end

  test "should destroy recurrent_payment" do
    assert_difference('RecurrentPayment.count', -1) do
      delete :destroy, :id => recurrent_payments(:one).id
    end

    assert_redirected_to recurrent_payments_path
  end
end
