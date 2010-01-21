class BalanceController < ApplicationController
  before_filter :login_required
  
  def index
    @year = params[:year] ? params[:year].to_i : Date.today.year
  end
  
end
