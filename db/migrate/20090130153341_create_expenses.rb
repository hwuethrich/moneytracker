class CreateExpenses < ActiveRecord::Migration
  def self.up
    create_table :expenses do |t|
      t.float :amount
      t.string :description
      t.date :date
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :expenses
  end
end
