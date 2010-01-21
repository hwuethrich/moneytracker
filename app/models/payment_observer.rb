class PaymentObserver < ActiveRecord::Observer
  
  def after_create(payment)
    Notifier.deliver_new_payment_notification(payment)
  end
  
  def after_update(payment)
    Notifier.deliver_updated_payment_notification(payment)
  end
  
  def after_destroy(payment)
    Notifier.deliver_destroyed_payment_notification(payment)
  end
  
end
