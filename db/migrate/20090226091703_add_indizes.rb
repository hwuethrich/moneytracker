class AddIndizes < ActiveRecord::Migration
  def self.up
    add_index :expenses, :date
    add_index :expenses, :user_id
    add_index :expenses, :recurrent_expense_id
    
    add_index :recurrent_expenses, :user_id
    
    add_index :payments, :date
    add_index :payments, :sender_id
    add_index :payments, :recipient_id
    add_index :payments, :recurrent_payment_id
    
    add_index :recurrent_payments, :sender_id
    add_index :recurrent_payments, :recipient_id
  end

  def self.down
  end
end
