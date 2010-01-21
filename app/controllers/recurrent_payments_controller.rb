class RecurrentPaymentsController < ApplicationController
  before_filter :login_required
  
  def authorized?(action = action_name, recurrent_payment = nil)
    if [:edit, :update, :destroy].include?(action)
      is_admin? || recurrent_payment.sender == current_user
    else
      logged_in?
    end
  end
  
  # GET /recurrent_payments
  # GET /recurrent_payments.xml
  def index
    @recurrent_payments = RecurrentPayment.all
    
    respond_to do |format|
      format.html { render :action => 'index' }
      format.xml  { render :xml => @recurrent_payments }
    end
  end

  # GET /recurrent_payments/1
  # GET /recurrent_payments/1.xml
  def show
    @recurrent_payment = RecurrentPayment.find(params[:id])
    index
  end

  # GET /recurrent_payments/new
  # GET /recurrent_payments/new.xml
  def new
    @recurrent_payment = RecurrentPayment.new :months => (1..12).to_a
    @recipients = User.by_name.except(current_user)
    @form_id = @recurrent_payment.object_id

    respond_to do |format|
      format.html { index }
      format.xml  { render :xml => @recurrent_payment }
      format.js  { 
        render :partial => "common/new", :locals => { 
          :form_id => @form_id, :object => @recurrent_payment 
        } 
      }
    end
  end

  # GET /recurrent_payment/1/edit
  def edit
    @recurrent_payment = RecurrentPayment.find(params[:id])
    @recipients = User.by_name.except(@recurrent_payment.sender)
    @form_id = @recurrent_payment.id

    respond_to do |format|
      format.html  {
        render :partial => "recurrent_payment", :locals => { 
          :recurrent_payment => @recurrent_payment 
        }
      }
      format.js  { 
        render :partial => "common/edit", :locals => { 
          :form_id => @form_id, :object => @recurrent_payment 
        } 
      }
    end
  end

  # POST /recurrent_payments
  # POST /recurrent_payments.xml
  def create
    params[:recurrent_payment][:months] ||= []
    @recurrent_payment = RecurrentPayment.new(params[:recurrent_payment])
    @recurrent_payment.sender = current_user
    
    @form_id = params[:id]
    
    respond_to do |format|
      if @recurrent_payment.save
        format.html { redirect_to(@recurrent_payment) }
        format.xml  { render :xml => @recurrent_payment, :status => :created, :location => @recurrent_payment }
        format.js  { 
          render :partial => "common/create", :locals => { 
            :form_id => @form_id, :object => @recurrent_payment 
          } 
        }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recurrent_payment.errors, :status => :unprocessable_entity }
        format.js  { 
          render :partial => "common/form_error.rjs", :locals => { 
            :form_id => @form_id, :object => @recurrent_payment 
          } 
        }
      end
    end
  end

  # PUT /recurrent_payments/1
  # PUT /recurrent_payments/1.xml
  def update
    params[:recurrent_payment][:months] ||= []
    @recurrent_payment = RecurrentPayment.find(params[:id])
    @form_id = @recurrent_payment.id
    
    respond_to do |format|
      if @recurrent_payment.update_attributes(params[:recurrent_payment])
        format.html { redirect_to(@recurrent_payment) }
        format.xml  { head :ok }
        format.js  { 
          render :partial => "common/create", :locals => { 
            :form_id => @form_id, :object => @recurrent_payment 
          } 
        }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recurrent_payment.errors, :status => :unprocessable_entity }
        format.js  { 
          render :partial => "common/form_error.rjs", :locals => { 
            :form_id => @form_id, :object => @recurrent_payment 
          } 
        }
      end
    end
  end
  
  def cancel
    if RecurrentPayment.exists? params[:id]
      @recurrent_payment = RecurrentPayment.find(params[:id])
      @form_id = @recurrent_payment.id
    else
      @recurrent_payment = nil
      @form_id = params[:id]
    end
    
    respond_to do |format|
      format.html { redirect_to(recurrent_payments_path) }
      format.xml  { head :ok }
      format.js  { 
        render :partial => "common/cancel", :locals => { 
          :form_id => @form_id, :object => @recurrent_payment 
        } 
      }
    end
  end

  # DELETE /recurrent_payments/1
  # DELETE /recurrent_payments/1.xml
  def destroy
    @recurrent_payment = RecurrentPayment.find(params[:id])
    
    if authorized?(:destroy, @recurrent_payment)
      @recurrent_payment.destroy
      respond_to do |format|
        format.html { redirect_to(recurrent_payments_url) }
        format.xml  { head :ok }
        format.js  { 
          render :partial => "common/destroy", :locals => { 
            :form_id => @form_id,
            :object => @recurrent_payment
          } 
        }
      end
    end
  end
end