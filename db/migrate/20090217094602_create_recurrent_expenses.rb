class CreateRecurrentExpenses < ActiveRecord::Migration
  def self.up
    create_table :recurrent_expenses do |t|
      t.float :amount
      t.string :description
      t.string :months
      t.integer :day
      
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :recurrent_expenses
  end
end
