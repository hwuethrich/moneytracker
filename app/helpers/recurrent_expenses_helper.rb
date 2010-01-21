module RecurrentExpensesHelper
  
  def belongs_to_current_user(recurrent_expense)
    recurrent_expense.user == current_user
  end
  
  def new_recurrent_expense_link
    link_to_remote t('views.action.new'), 
      :url => new_recurrent_expense_path, :method => :get,
      :loading => show_indicator('recurrent-expense-indicator'), 
      :complete => hide_indicator('recurrent-expense-indicator'),
      :html => { :class => "new" }
  end
  
  def edit_recurrent_expense_link(recurrent_expense)
    edit_action_link(recurrent_expense)
  end
  
  def destroy_recurrent_expense_link(recurrent_expense)
    destroy_action_link(recurrent_expense)
  end
  
  def cancel_recurrent_expense_form_button(form_id)
    button_to_remote t('views.form.cancel'), 
      :url => { :action => "cancel", :id => form_id }, 
      :loading => show_indicator('recurrent-expense-indicator'), 
      :complete => hide_indicator('recurrent-expense-indicator')
  end
  
  def remote_recurrent_expenses_form(recurrent_expense, form_id, &block)
    remote_form_for recurrent_expense, 
      :url => { :action => recurrent_expense.new_record? ? "create" : "update", :id => form_id }, 
      :html => {:id => form_id}, 
      :loading => show_indicator('recurrent-expense-indicator'), 
      :complete => hide_indicator('recurrent-expense-indicator'),
      &block
  end
  
  def class_name_for_recurrent_expense_month(expense, month)
    if expense.active_for_month? month
      date = Date.civil(Date.today.year, month)
      if expense.already_created_for_month?(date)
        "active-month-created"
      else
        "active-month"
      end
    end
  end
end
