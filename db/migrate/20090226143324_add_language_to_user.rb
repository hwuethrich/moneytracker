class AddLanguageToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :language, :string
    
    User.update_all "language = 'en'" 
  end

  def self.down
    remove_column :users, :language
  end
end
