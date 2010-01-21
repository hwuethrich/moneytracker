class PaymentsController < ApplicationController
  before_filter :login_required
  cache_sweeper :balance_sweeper
  
  def authorized?(action = action_name, payment = nil)
    if [:edit, :update, :destroy].include?(action)
      is_admin? || payment.sender == current_user
    else
      logged_in?
    end
  end
  
  # GET /payments
  # GET /payments.xml
  def index
    
    if @payment.nil?
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
      @date = @payment.date
    end
    
    @payments = Payment.by_month(@date)
    
    respond_to do |format|
      format.html { render :action => 'index' }
      format.xml  { render :xml => @payments }
    end
  end

  # GET /payments/1
  # GET /payments/1.xml
  def show
    @payment = Payment.find(params[:id])
    index
  end

  # GET /payments/new
  # GET /payments/new.xml
  def new
    @payment = Payment.new(params[:payment])
    @payment.date = params[:date].nil? ? Date.today : Date.parse(params[:date])
    
    @recipients = User.by_name.except(current_user)
    @form_id = @payment.object_id

    respond_to do |format|
      format.html { index }
      format.xml  { render :xml => @payment }
      format.js  { 
        render :partial => "common/new", :locals => { 
          :form_id => @form_id, :object => @payment 
        } 
      }
    end
  end

  # GET /payment/1/edit
  def edit
    @payment = Payment.find(params[:id])
    
    @recipients = User.by_name.except(@payment.sender)
    @form_id = @payment.id

    respond_to do |format|
      format.html  { render :partial => "payment", :locals => { :payment => @payment } }
      format.js  { 
        render :partial => "common/edit", :locals => { 
          :form_id => @form_id, :object => @payment 
        } 
      }
    end
  end

  # POST /payments
  # POST /payments.xml
  def create
    @payment = Payment.new(params[:payment])
    @payment.sender = current_user
    @form_id = params[:id]
    
    respond_to do |format|
      if @payment.save
        format.html { redirect_to(@payment) }
        format.xml  { render :xml => @payment, :status => :created, :location => @payment }
        format.js { render :action => 'create' }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payment.errors, :status => :unprocessable_entity }
        format.js { 
          render :partial => 'common/form_error.rjs', :locals => { 
            :object => @payment, :form_id => @form_id
          } 
        }
      end
    end
  end

  # PUT /payments/1
  # PUT /payments/1.xml
  def update
    @payment = Payment.find(params[:id])
    @form_id = @payment.id
    
    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to(@payment) }
        format.xml  { head :ok }
        format.js { render :action => "update" }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment.errors, :status => :unprocessable_entity }
        format.js { 
          render :partial => 'common/form_error.rjs', :locals => { 
            :object => @payment, :form_id => @form_id
          } 
        }
      end
    end
  end
  
  def cancel
    if Payment.exists? params[:id]
      @payment = Payment.find(params[:id])
      @form_id = @payment.id
    else
      @payment = nil
      @form_id = params[:id]
    end
    
    respond_to do |format|
      format.html { redirect_to(payments_path) }
      format.xml  { head :ok }
      format.js  { 
        render :partial => "common/cancel", :locals => { 
          :form_id => @form_id, :object => @payment 
        } 
      }
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.xml
  def destroy
    @payment = Payment.find(params[:id])
    if authorized?(:destroy, @payment)
      @payment.destroy
      respond_to do |format|
        format.html { redirect_to(payments_url) }
        format.xml  { head :ok }
        format.js { render :action => "destroy" }
      end
    end
  end
end
