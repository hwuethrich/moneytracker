class RecurrentExpensesController < ApplicationController
  before_filter :login_required
  
  auto_complete_for :recurrent_expense, :description
  
  def authorized?(action = action_name, recurrent_expense = nil)
    if [:edit, :update, :destroy].include?(action)
      is_admin? || recurrent_expense.user == current_user
    else
      logged_in?
    end
  end
  
  # GET /recurrent_expenses
  # GET /recurrent_expenses.xml
  def index
    @recurrent_expenses = RecurrentExpense.all
    
    respond_to do |format|
      format.html { render :action => 'index' }
      format.xml  { render :xml => @recurrent_expenses }
    end
  end

  # GET /recurrent_expenses/1
  # GET /recurrent_expenses/1.xml
  def show
    @recurrent_expense = RecurrentExpense.find(params[:id])
    index
  end

  # GET /recurrent_expenses/new
  # GET /recurrent_expenses/new.xml
  def new
    @recurrent_expense = RecurrentExpense.new :months => (1..12).to_a
    @form_id = @recurrent_expense.object_id

    respond_to do |format|
      format.html { index }
      format.xml  { render :xml => @recurrent_expense }
      format.js  { 
        render :partial => "common/new", :locals => { 
          :form_id => @form_id, :object => @recurrent_expense 
        } 
      }
    end
  end

  # GET /recurrent_expense/1/edit
  def edit
    @recurrent_expense = RecurrentExpense.find(params[:id])
    @form_id = @recurrent_expense.id

    respond_to do |format|
      format.html  { 
        render :partial => "recurrent_expense", :locals => {
          :recurrent_expense => @recurrent_expense 
        }
      }
      format.js  { 
        render :partial => "common/edit", :locals => { 
          :form_id => @form_id, :object => @recurrent_expense 
        } 
      }
    end
  end

  # POST /recurrent_expenses
  # POST /recurrent_expenses.xml
  def create
    params[:recurrent_expense][:months] ||= []
    @recurrent_expense = RecurrentExpense.new(params[:recurrent_expense])
    @recurrent_expense.user = current_user
    
    @form_id = params[:id]
    
    respond_to do |format|
      if @recurrent_expense.save
        format.html { redirect_to(@recurrent_expense) }
        format.xml  { render :xml => @recurrent_expense, :status => :created, :location => @recurrent_expense }
        format.js  { 
          render :partial => "common/create", :locals => { 
            :form_id => @form_id, :object => @recurrent_expense 
          } 
        }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recurrent_expense.errors, :status => :unprocessable_entity }
        format.js  { 
          render :partial => "common/form_error.rjs", :locals => { 
            :form_id => @form_id, :object => @recurrent_expense 
          } 
        }
      end
    end
  end

  # PUT /recurrent_expenses/1
  # PUT /recurrent_expenses/1.xml
  def update
    params[:recurrent_expense][:months] ||= []
    @recurrent_expense = RecurrentExpense.find(params[:id])
    @form_id = @recurrent_expense.id
    
    respond_to do |format|
      if @recurrent_expense.update_attributes(params[:recurrent_expense])
        format.html { redirect_to(@recurrent_expense) }
        format.xml  { head :ok }
        format.js  { 
          render :partial => "common/create", :locals => { 
            :form_id => @form_id, :object => @recurrent_expense 
          } 
        }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recurrent_expense.errors, :status => :unprocessable_entity }
        format.js  { 
          render :partial => "common/form_error.rjs", :locals => { 
            :form_id => @form_id, :object => @recurrent_expense 
          } 
        }
      end
    end
  end
  
  def cancel
    if RecurrentExpense.exists? params[:id]
      @recurrent_expense = RecurrentExpense.find(params[:id])
      @form_id = @recurrent_expense.id
    else
      @recurrent_expense = nil
      @form_id = params[:id]
    end
    
    respond_to do |format|
      format.html { redirect_to(recurrent_expenses_path) }
      format.xml  { head :ok }
      format.js  { 
        render :partial => "common/cancel", :locals => { 
          :form_id => @form_id, :object => @recurrent_expense 
        } 
      }
    end
  end

  # DELETE /recurrent_expenses/1
  # DELETE /recurrent_expenses/1.xml
  def destroy
    @recurrent_expense = RecurrentExpense.find(params[:id])
    
    if authorized?(:destroy, @recurrent_expense)
      @recurrent_expense.destroy
      respond_to do |format|
        format.html { redirect_to(recurrent_expenses_url) }
        format.xml  { head :ok }
        format.js  { 
          render :partial => "common/destroy", :locals => { 
            :form_id => @form_id,
            :object => @recurrent_expense
          } 
        }
      end
    end
  end
end