class RecurrentExpense < ActiveRecord::Base
  
  belongs_to :user
  has_many :expenses, :dependent => :nullify
  
  serialize :months
  
  validates_presence_of     :user
  validates_presence_of     :amount
  validates_numericality_of :amount, :greater_than => 0.0
  validates_presence_of     :description
  #validates_presence_of     :months
  validates_inclusion_of    :day, :in => 1..31
  
  def active_for_month?(month)
    months.include? month
  end
  
  def average_per_month
    (amount * months.size) / 12.0
  end
  
  def months=(mon)
    write_attribute(:months, mon.map { |m| m.to_i })
  end
  
  def months
    read_attribute(:months).map { |m| m.to_i }
  end
  
  def create_expense
    Expense.create(
      :user => user,
      :date => Date.today,
      :amount => amount,
      :description => description,
      :recurrent_expense => self
    )
  end
  
  def due_today?
    today = Date.today
    months.include?(today.month) && today.day == day
  end

  def already_created_today?
    expenses.count(:conditions => ["date = ?", Date.today]) >= 1
  end
  
  def already_created_for_month?(month)
    expenses.count(:conditions => ["date >= ? AND date <= ?", 
      month.beginning_of_month, month.end_of_month,]) >= 1
  end
  
  def self.create_all_due_expenses_unless_created
    expenses = []
    RecurrentExpense.all.each do |re|
      expenses << re.create_expense if re.due_today? and not re.already_created_today?
    end
    expenses
  end
end
