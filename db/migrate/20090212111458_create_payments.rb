class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.float :amount
      t.date :date
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
