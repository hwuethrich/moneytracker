class AddRecurrentExpenseReferenceToExpense < ActiveRecord::Migration
  def self.up
    add_column :expenses, :recurrent_expense_id, :integer
    
    Expense.reset_column_information
    
    RecurrentExpense.all.each do |re|
      Expense.find_all_by_user_id(re.user).each do |e|
        if re.description == e.description
          re.expenses << e
        end
      end
      re.save!
    end
  end

  def self.down
    remove_column :expenses, :recurrent_expense_id
  end
end
