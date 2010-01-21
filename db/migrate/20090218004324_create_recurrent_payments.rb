class CreateRecurrentPayments < ActiveRecord::Migration
  def self.up
    create_table :recurrent_payments do |t|
      t.float :amount
      t.string :comment
      t.string :months
      t.integer :day
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end
  end

  def self.down
    drop_table :recurrent_payments
  end
end
