class BalanceSweeper < ActionController::Caching::Sweeper
    observe Payment, Expense, User

    def after_create(record)
      if record.is_a? User
        expire_all
      end
    end

    def after_save(record)
      expire_user_balance
      unless record.is_a? User
        expire_after record.date
      end
    end
    
    def after_destroy(record)
      expire_user_balance
      if record.is_a? User
        expire_all
      else
        expire_after record.date
      end
    end
    
    protected
    
    def expire_all
      logger.debug "Expiring all month balances"
      expire_fragment /balance\/month\/\d+\/\d+/
    end
    
    def expire_after date
      logger.debug "Expiring month balances after #{date.strftime("%Y-%m")}"
      expire_remaining_months(date)
      expire_following_years(date)
    end
    
    def expire_remaining_months date
      months = (date.month..12).to_a.join("|")
      expire_fragment Regexp.new("balance\/month\/#{date.year}\/(#{months})")
    end
    
    def expire_following_years date
      year = (date.year+1..date.year+10).to_a.join("|")
      expire_fragment Regexp.new("balance\/month\/(#{year})\/\\d+")
    end
    
    def expire_user_balance
      #logger.debug "Expiring user balances"
      expire_fragment /balance\/user\/\d+/
    end

  end
