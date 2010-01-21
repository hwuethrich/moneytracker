class AddBankAccountNoToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :bank_account_no, :string
  end

  def self.down
    remove_column :users, :bank_account_no
  end
end
