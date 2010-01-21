class UsersController < ApplicationController
  before_filter :login_required
  cache_sweeper :balance_sweeper

  def authorized?(action = action_name, user = nil)
    if [:new, :create, :destroy].include?(action)
      is_admin?
    elsif [:edit, :update].include?(action)
      is_admin? || user == current_user
    else
      logged_in?
    end
  end
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  # render new.rhtml
  def new
    @user = User.new
    @form_id = @user.object_id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
      format.js { 
        render :partial => 'common/new', :locals => { 
          :object => @user, :form_id => @form_id
        } 
      }
    end
  end
 
  def create
    @user = User.new(params[:user])
    @form_id = params[:id]
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
        format.js { 
          render :partial => 'common/create', :locals => { 
            :object => @user, :form_id => @form_id
          } 
        }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        format.js { 
          render :partial => 'common/form_error.rjs', :locals => { 
            :object => @user, :form_id => @form_id
          } 
        }
      end
    end
  end
  
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @form_id = @user.id

    respond_to do |format|
      format.html  { render :partial => "user", :locals => { :user => @user } }
      format.js { 
        render :partial => 'common/edit', :locals => { 
          :object => @user, :form_id => @form_id
        } 
      }
    end
  end
  
  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    @form_id = @user.id

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
        format.js { 
          render :partial => 'common/update', :locals => { 
            :object => @user, :form_id => @form_id
          } 
        }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        format.js { 
          render :partial => 'common/form_error.rjs', :locals => { 
            :object => @user, :form_id => @form_id
          } 
        }
      end
    end
  end
  
  def cancel
    if User.exists? params[:id]
      @user = User.find(params[:id])
      @form_id = @user.id
    else
      @user = nil
      @form_id = params[:id]
    end
    
    respond_to do |format|
      format.html { redirect_to(users_path) }
      format.xml  { head :ok }
      format.js { 
        render :partial => 'common/cancel', :locals => { 
          :object => @user, :form_id => @form_id
        } 
      }
    end
  end
  
  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    
    if authorized?(:destroy, @user)
      @user.destroy
      respond_to do |format|
        format.html { redirect_to(users_url) }
        format.xml  { head :ok }
        format.js { 
          render :partial => 'common/destroy', :locals => { 
            :object => @user
          } 
        }
      end
    end
  end
  
end
