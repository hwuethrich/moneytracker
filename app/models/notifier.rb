class Notifier < ActionMailer::Base
  
  def new_payment_notification(payment)
       recipients   payment.recipient.email
       from         payment.sender.email
       subject      "[MoneyTracker] New payment from #{payment.sender.name}"
       body         :payment => payment
       content_type "text/html"
  end
  
  def updated_payment_notification(payment)
       recipients   payment.recipient.email
       from         payment.sender.email
       subject      "[MoneyTracker] Updated payment from #{payment.sender.name}"
       body         :payment => payment
       content_type "text/html"
  end
  
  def destroyed_payment_notification(payment)
       recipients   payment.recipient.email
       from         payment.sender.email
       subject      "[MoneyTracker] Deleted payment from #{payment.sender.name}"
       body         :payment => payment
       content_type "text/html"
  end
  
end
