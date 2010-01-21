class Payment < ActiveRecord::Base
  
  belongs_to :sender,       :class_name => "User" 
  belongs_to :recipient,    :class_name => "User"
  belongs_to :recurrent_payment
  
  validates_presence_of     :sender
  validates_presence_of     :recipient
  validates_presence_of     :amount
  validates_numericality_of :amount, :greater_than => 0.0
  validates_presence_of     :date
  
  named_scope :by_month, lambda { |date|
    { :conditions => ['date >= ? AND date <= ?', date.beginning_of_month, date.end_of_month] }
  }
  
  named_scope :until, lambda { |date|
    { :conditions => ['date < ?', date] }
  }
  
  def recurrent?
    return !recurrent_payment.nil?
  end
end
