require 'test_helper'

class RecurrentExpensesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recurrent_expenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recurrent_expense" do
    assert_difference('RecurrentExpense.count') do
      post :create, :recurrent_expense => { }
    end

    assert_redirected_to recurrent_expense_path(assigns(:recurrent_expense))
  end

  test "should show recurrent_expense" do
    get :show, :id => recurrent_expenses(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => recurrent_expenses(:one).id
    assert_response :success
  end

  test "should update recurrent_expense" do
    put :update, :id => recurrent_expenses(:one).id, :recurrent_expense => { }
    assert_redirected_to recurrent_expense_path(assigns(:recurrent_expense))
  end

  test "should destroy recurrent_expense" do
    assert_difference('RecurrentExpense.count', -1) do
      delete :destroy, :id => recurrent_expenses(:one).id
    end

    assert_redirected_to recurrent_expenses_path
  end
end
