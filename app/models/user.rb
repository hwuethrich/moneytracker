require 'digest/sha1'
require 'debt_calculations'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  include DebtCalculations
  
  has_many :expenses,           :dependent => :destroy
  has_many :recurrent_expenses, :dependent => :destroy
  has_many :sent_payments,      :dependent => :destroy, :class_name => "Payment", :foreign_key => "sender_id"
  has_many :received_payments,  :dependent => :destroy, :class_name => "Payment", :foreign_key => "recipient_id"

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :firstname,:with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :firstname,:maximum => 100
  
  validates_format_of       :lastname, :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :lastname, :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message


  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :firstname, :lastname, :language, :password, :password_confirmation, :admin, :bank_account_no
  
  named_scope :by_name, :order => "firstname ASC, lastname ASC"

  named_scope :except, lambda { |user|
    { :conditions => ["id <> ?", user.id ] }
  }

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end
  
  def name
    "#{self.firstname} #{self.lastname}"
  end
  
  def expenses_by_month(date)
    self.expenses.by_month(date)
  end
  
  def expenses_sum_by_month(date)
    expenses_by_month(date).sum(:amount)
  end
  
  def expenses_delta_by_month(date)
    expenses_sum_by_month(date) - Expense.average_by_month(date)
  end
  
  def payments_sum_received_by_month(date)
    received_payments.by_month(date).sum(:amount)
  end
  
  def payments_sum_sent_by_month(date)
    sent_payments.by_month(date).sum(:amount)
  end
  
  def balance_by_month(date)
    expenses_sum_by_month(date) + payments_sum_sent_by_month(date) - payments_sum_received_by_month(date)
  end
  
  def balance_until(date)
    expenses.until(date).sum(:amount) + sent_payments.until(date).sum(:amount) - received_payments.until(date).sum(:amount)
  end
  
  def delta_by_month(date)
    balance_by_month(date) - Expense.average_by_month(date)
  end
  
  def delta_until(date)
    balance_until(date) - Expense.average_until(date)
  end
  
  def expenses_sum
    expenses.sum(:amount)
  end
  
  def payments_sum_received
    received_payments.sum(:amount)
  end
  
  def payments_sum_sent
    sent_payments.sum(:amount)
  end
  
  def balance
    expenses_sum + payments_sum_sent - payments_sum_received
  end
  
  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  protected
    
end
