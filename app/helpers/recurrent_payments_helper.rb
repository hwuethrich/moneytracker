module RecurrentPaymentsHelper
  
  def belongs_to_current_user(recurrent_payment)
    recurrent_payment.user == current_user
  end
  
  def new_recurrent_payment_link
    link_to_remote "Create New", 
      :url => new_recurrent_payment_path, :method => :get,
      :loading => show_indicator('recurrent-payment-indicator'), 
      :complete => hide_indicator('recurrent-payment-indicator'),
      :html => { :class => "new" }
  end
  
  def edit_recurrent_payment_link(recurrent_payment)
    edit_action_link(recurrent_payment)
  end
  
  def destroy_recurrent_payment_link(recurrent_payment)
    destroy_action_link(recurrent_payment)
  end
  
  def cancel_recurrent_payment_form_button(form_id)
    button_to_remote "Cancel", 
      :url => { :action => "cancel", :id => form_id }, 
      :loading => show_indicator('recurrent-payment-indicator'), 
      :complete => hide_indicator('recurrent-payment-indicator')
  end
  
  def remote_recurrent_payments_form(recurrent_payment, form_id, &block)
    remote_form_for recurrent_payment, 
      :url => { :action => recurrent_payment.new_record? ? "create" : "update", :id => form_id }, 
      :html => {:id => form_id}, 
      :loading => show_indicator('recurrent-payment-indicator'), 
      :complete => hide_indicator('recurrent-payment-indicator'),
      &block
  end
  
  def class_name_for_recurrent_payment_month(payment, month)
    if payment.active_for_month? month
      date = Date.civil(Date.today.year, month)
      if payment.already_created_for_month?(date)
        "active-month-created"
      else
        "active-month"
      end
    end
  end
end
