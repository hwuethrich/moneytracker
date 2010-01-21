# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def form_title record
    model = record.class.name.underscore
    t "views.#{model}.form.title.#{record.new_record? ? 'new' : 'edit'}"
  end
  
  def menu_item controller, action = 'index'
    render :partial => 'common/menu_item', :locals => { :controller => controller, :action => action }
  end
  
  def records_date_range
    mins = []
    mins << Expense.minimum(:date) unless Expense.minimum(:date).nil?
    mins << Payment.minimum(:date) unless Payment.minimum(:date).nil?
    
    maxs = []
    maxs << Expense.maximum(:date) unless Expense.maximum(:date).nil?
    maxs << Payment.maximum(:date) unless Payment.maximum(:date).nil?
    
    [mins.min, maxs.max]
  end
  
  def rounded_corner_top
    render :partial => "common/rounded_corner_top"
  end
  
  def rounded_corner_bottom
    render :partial => "common/rounded_corner_bottom"
  end
  
  def number_to_currency number, with_unit = true
    (with_unit ? "%s CHF" : "%s") % number_with_precision(number, :delimiter => "'", :precision => 2) unless number.nil?
  end
  
  def show_indicator indicator
    "$('#{indicator}').blindDown({duration: 0.2});"
  end
  
  def hide_indicator indicator
    "$('#{indicator}').blindUp({duration: 0.2, queue: 'end'});"
  end
  
  def is_admin?
    !current_user.nil? && current_user.admin?
  end
  
  def edit_action_link(resource)
    if authorized?(:edit, resource)
      link_to_remote t("views.action.edit"), 
        :url => edit_polymorphic_path(resource), :method => :get,
        :loading => show_indicator_for(resource), 
        :complete => hide_indicator_for(resource)
    else
      disabled_action t("views.form.edit")
    end
  end
  
  def destroy_action_link(resource)
    if authorized?(:destroy, resource)
      link_to_remote t("views.action.delete"), 
        :url => polymorphic_path(resource), :method => :delete,
        :confirm => t('views.message.confirm_delete', :model => resource.class.human_name),
        :loading => show_indicator_for(resource), 
        :complete => hide_indicator_for(resource)
    else
      disabled_action t("views.action.delete")
    end
  end
  
  def disabled_action(action)
    "<span class='disabled-action'>%s</span>" % action
  end
  
  def show_indicator_for(resource)
    show_indicator("#{resource.class.name.downcase}-indicator")
  end
  
  def hide_indicator_for(resource)
    hide_indicator("#{resource.class.name.downcase}-indicator")
  end
end
