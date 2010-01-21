namespace :moneytracker do
  
  namespace :recure do
    
    desc "Create recurrent expenses and payments"
    task :all => [:expenses, :payments] do
      # Empty  
    end
    
    desc "Create recurrent expenses"
    task :expenses => :environment do
      puts "Creating recurrent expenses ..."
      
      created = RecurrentExpense.create_all_due_expenses_unless_created
      created.each do |e|
        puts " - %s" % e.inspect
      end
    end
    
    desc "Create recurrent payments"
    task :payments => :environment do
      puts "Creating recurrent payments ..."
      
      created = RecurrentPayment.create_all_due_payments_unless_created
      created.each do |e|
        puts " - %s" % e.inspect
      end
    end

  end
end