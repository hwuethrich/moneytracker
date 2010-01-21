module DebtCalculations
  
  def self.included(recipient)
    recipient.extend(ModelClassMethods)
    recipient.class_eval do
      include ModelInstanceMethods
    end
  end
  
  module ModelClassMethods
  
    def user_debts
      user_balances = User.all.map { |u|  [u, u.balance]}
      calc_debts(user_balances)
    end
    
    #private

    def avg_payments(user_balances)
      sum = user_balances.transpose[1].inject { |sum, p| sum += p }
      sum.to_f / user_balances.size.to_f
    end
  
    def calc_debts(user_balances)

      # Calculate average payment
      avg = avg_payments(user_balances)
    
      # Sort user payments by amount
      user_balances = user_balances.sort { |a,b| a[1] <=> b[1] }
    
      user_depts = {}; debt = 0; cred = user_balances.size - 1
      while(debt < cred)
        debt_diff = avg - user_balances[debt][1]
        cred_diff = user_balances[cred][1] - avg
      
        trans_diff = [debt_diff, cred_diff].min
      
        if trans_diff > 0
          user_depts[[user_balances[debt][0], user_balances[cred][0]]] = trans_diff
          user_balances[debt][1] += trans_diff
          user_balances[cred][1] -= trans_diff
        end
      
        debt += 1 unless user_balances[debt][1] < avg
        cred -= 1 unless user_balances[cred][1] > avg
      end
      
      user_depts
    end
  end
  
  module ModelInstanceMethods
    
    def debts
      debts = {}
      all_debts = self.class.user_debts
      all_debts.each { |u, d| debts[u[1]] = d if u[0] == self }
      debts
    end
    
    def credits
      credits = {}
      all_debts = self.class.user_debts
      all_debts.each { |u, d| credits[u[0]] = d if u[1] == self }
      credits
    end
    
  end # instance methods
  
end