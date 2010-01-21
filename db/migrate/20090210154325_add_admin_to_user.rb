class AddAdminToUser < ActiveRecord::Migration
  class User < ActiveRecord::Base
  end
  
  def self.up
    add_column :users, :admin, :boolean, :default => false
    
    User.reset_column_information

    say_with_time "Creating initial user (admin/password)" do
      User.create(
        :login => "admin",
        :firstname => "Admin",
        :lastname => "User",
        :crypted_password => "b0ada9a123bf9ed0372050baabf2ee7f7cbf34a9",
        :salt => "5b608d4e60c647c8aa54f36bc727262079d0a017", 
        :email => "admin@admin.com",
        :admin => true)
    end  
  end

  def self.down
    remove_column :users, :admin
  end
end
