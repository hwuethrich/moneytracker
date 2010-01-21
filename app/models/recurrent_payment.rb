class RecurrentPayment < ActiveRecord::Base
  
  belongs_to :sender,     :class_name => "User" 
  belongs_to :recipient,  :class_name => "User"
  has_many   :payments,   :dependent => :nullify
  
  serialize :months
  
  validates_presence_of     :sender
  validates_presence_of     :recipient
  validates_presence_of     :amount
  validates_numericality_of :amount, :greater_than => 0.0
  validates_presence_of     :comment
  #validates_presence_of     :months
  validates_inclusion_of    :day, :in => 1..31
  
  def active_for_month?(month)
    months.include? month
  end
  
  def months=(mon)
    write_attribute(:months, mon.map { |m| m.to_i })
  end
  
  def months
    read_attribute(:months).map { |m| m.to_i }
  end
  
  def create_payment
    Payment.create(
      :sender => sender,
      :recipient => recipient,
      :date => Date.today,
      :amount => amount,
      :comment => comment,
      :recurrent_payment => self
    )
  end
  
  def due_today?
    today = Date.today
    months.include?(today.month) && today.day == day
  end

  def already_created_today?
    payments.count(:conditions => ["date = ?", Date.today]) >= 1
  end
  
  def already_created_for_month?(month)
    payments.count(:conditions => ["date >= ? AND date <= ?", 
      month.beginning_of_month, month.end_of_month,]) >= 1
  end
  
  def self.create_all_due_payments_unless_created
    payments = []
    RecurrentPayment.all.each do |rp|
      payments << rp.create_payment if rp.due_today? and not rp.already_created_today?
    end
    payments
  end
end
