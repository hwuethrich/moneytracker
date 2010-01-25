class ExpensesController < ApplicationController
  before_filter :login_required
  cache_sweeper :balance_sweeper
  
  auto_complete_for :expense, :description
  
  def authorized?(action = action_name, expense = nil)
    if [:edit, :update, :destroy].include?(action)
      is_admin? || expense.user == current_user
    else
      logged_in?
    end
  end
  
  # GET /expenses
  # GET /expenses.xml
  def index
    if @expense.nil?
      today = Date.today
      year = params[:year].to_i if params[:year]
      month = params[:month].to_i if params[:month]
      
      @date = today
      
      if year && month
        day = today.day
        if year != today.year || month != today.month
          day = 1
        end
        @date = Date.civil(year, month, day)
      end
    else
      @date = @expense.date
    end
    
    @expenses = Expense.by_month(@date)
    
    respond_to do |format|
      format.html { render :action => 'index' }
      format.xml  { render :xml => @expenses }
    end
  end

  # GET /expenses/1
  # GET /expenses/1.xml
  def show
    @expense = Expense.find(params[:id])
    index
  end

  # GET /expenses/new
  # GET /expenses/new.xml
  def new
    @expense = Expense.new
    @expense.date = params[:date].nil? ? Date.today : Date.parse(params[:date])
    @form_id = @expense.id

    respond_to do |format|
      format.html { index }
      format.xml  { render :xml => @expense }
      format.js  { 
        render :partial => "common/new", :locals => { 
          :form_id => @form_id, :object => @expense 
        } 
      }
    end
  end

  # GET /expense/1/edit
  def edit
    @expense = Expense.find(params[:id])
    @form_id = @expense.id

    respond_to do |format|
      format.html  { render :partial => "expense", :locals => { :expense => @expense } }
      format.js  { 
        render :partial => "common/edit", :locals => { 
          :form_id => @form_id, :object => @expense 
        } 
      }
    end
  end

  # POST /expenses
  # POST /expenses.xml
  def create
    @expense = Expense.new(params[:expense])
    @expense.user = current_user
    @form_id = params[:id]
    
    respond_to do |format|
      if @expense.save
        format.html { redirect_to(@expense) }
        format.xml  { render :xml => @expense, :status => :created, :location => @expense }
        format.js { render :action => 'create' }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @expense.errors, :status => :unprocessable_entity }
        format.js { 
          render :partial => 'common/form_error.rjs', :locals => { 
            :object => @expense, :form_id => @form_id
          } 
        }
      end
    end
  end

  # PUT /expenses/1
  # PUT /expenses/1.xml
  def update
    @expense = Expense.find(params[:id])
    @form_id = @expense.id
    
    respond_to do |format|
      if @expense.update_attributes(params[:expense])
        format.html { redirect_to(@expense) }
        format.xml  { head :ok }
        format.js { render :action => "update" }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @expense.errors, :status => :unprocessable_entity }
        format.js { 
          render :partial => 'common/form_error.rjs', :locals => { 
            :object => @expense, :form_id => @form_id
          } 
        }
      end
    end
  end
  
  def cancel
    if params[:id] && Expense.exists?(params[:id])
      @expense = Expense.find(params[:id])
      @form_id = @expense.id
    else
      @expense = nil
      @form_id = params[:id]
    end
    
    respond_to do |format|
      format.html { redirect_to(expenses_path) }
      format.xml  { head :ok }
      format.js  { 
        render :partial => "common/cancel", :locals => { 
          :form_id => @form_id, :object => @expense 
        } 
      }
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.xml
  def destroy
    @expense = Expense.find(params[:id])
    if authorized?(:destroy, @expense)
      @expense.destroy
      respond_to do |format|
        format.html { redirect_to(expenses_url) }
        format.xml  { head :ok }
        format.js { render :action => "destroy" }
      end
    end
  end
end
