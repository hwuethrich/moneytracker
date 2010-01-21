class AddRecurrentPaymentReferenceToPayment < ActiveRecord::Migration
  def self.up
    add_column :payments, :recurrent_payment_id, :integer
    
    Payment.reset_column_information
    
    RecurrentPayment.all.each do |rp|
      Payment.all(
        :conditions => { 
          :sender_id    => rp.sender, 
          :recipient_id => rp.recipient,
          :comment      => rp.comment
        }
      ).each do |p|
        rp.payments << p
      end
      rp.save!
    end
  end

  def self.down
    remove_column :payments, :recurrent_payment_id
  end
end
