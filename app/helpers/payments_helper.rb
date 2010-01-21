module PaymentsHelper
  
  def new_payment_link(date)
    link_to_remote t("views.action.new"), 
      :url => new_payment_path(:date => date), :method => :get,
      :loading => show_indicator('payment-indicator'), 
      :complete => hide_indicator('payment-indicator'),
      :html => { :class => "new" }
  end
  
  def edit_payment_link(payment)
    edit_action_link(payment)
  end
  
  def destroy_payment_link(payment)
    destroy_action_link(payment)
  end
  
  def cancel_payment_form_button(form_id)
    button_to_remote t("views.form.cancel"), 
      :url => { :action => "cancel", :id => form_id }, 
      :loading => show_indicator('payment-indicator'), 
      :complete => hide_indicator('payment-indicator')
  end
  
  def payment_date_selector_options(date)
    { :readonly => true, 
      :month_year => "label", 
      :popup => :force, 
      :style => "width: 150px", 
      :image => 'icons/calendar.png',
      :valid_date_check => "(date.getMonth()+1) == #{date.month}" }
  end
  
  def remote_payments_form(payment, form_id, &block)
    remote_form_for payment, 
      :url => { :action => payment.new_record? ? "create" : "update", :id => form_id }, 
      :html => {:id => form_id}, 
      :loading => show_indicator('payment-indicator'), 
      :complete => hide_indicator('payment-indicator'),
      &block
  end
  
end
