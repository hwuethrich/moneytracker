class Expense < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :recurrent_expense
  
  validates_presence_of     :user
  validates_presence_of     :amount
  validates_numericality_of :amount, :greater_than => 0.0
  validates_presence_of     :description
  validates_presence_of     :date
  
  named_scope :by_year, lambda { |date|
    { :conditions => ['date >= ? AND date <= ?', date.beginning_of_year, date.end_of_year] }
  }
  
  named_scope :by_month, lambda { |date|
    { :conditions => ['date >= ? AND date <= ?', date.beginning_of_month, date.end_of_month] }
  }
  
  named_scope :until, lambda { |date|
    { :conditions => ['date < ?', date] }
  }
  
  def self.average_by_month(date)
    User.count > 0 ? sum_by_month(date) / User.count : nil
  end
  
  def self.average_until(date)
    User.count > 0 ? sum_until(date) / User.count : nil
  end
  
  def self.sum_by_month(date)
    Expense.by_month(date).sum(:amount)
  end
  
  def self.sum_until(date)
    Expense.until(date).sum(:amount)
  end
  
  def self.sums_by_month(year)
    sums = Array.new(12, 0.0)
    Expense.by_year(Date.civil(year)).sum(
      :amount, 
      :group => Expense.month_query
    ).each { 
      |month,amount| sums[month.to_i - 1] = amount
    }
    sums
  end
  
  def self.year_query
    case connection.adapter_name
      when "MySQL" then "YEAR(date)"
      when "SQLite" then "STRFTIME('%Y', date)"
      when "PostgreSQL" then "date_part('year', date)"
    end
  end
  
  def self.month_query
    case connection.adapter_name
      when "MySQL" then "MONTH(date)"
      when "SQLite" then "STRFTIME('%m', date)"
      when "PostgreSQL" then "date_part('month', date)"
    end
  end
  
  def recurrent?
    return !recurrent_expense.nil?
  end
end
