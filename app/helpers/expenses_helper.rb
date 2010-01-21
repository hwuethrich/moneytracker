module ExpensesHelper
  
  include ChartHelper
  
  def belongs_to_current_user(expense)
    expense.user == current_user
  end
  
  def new_expense_link(date)
    link_to_remote t("views.action.new"), 
      :url => new_expense_path(:date => date), :method => :get,
      :loading => show_indicator('expense-indicator'), 
      :complete => hide_indicator('expense-indicator'),
      :html => { :class => "new" }
  end
  
  def edit_expense_link(expense)
    edit_action_link(expense)
  end
  
  def destroy_expense_link(expense)
    destroy_action_link(expense)
  end
  
  def cancel_expense_form_button(form_id)
    button_to_remote t("views.form.cancel"), 
      :url => { :action => "cancel", :id => form_id }, 
      :loading => show_indicator('expense-indicator'), 
      :complete => hide_indicator('expense-indicator')
  end
  
  def expense_date_selector_options(date)
    { :readonly => true, 
      :month_year => "label", 
      :popup => :force, 
      :style => "width: 150px", 
      :image => 'icons/calendar.png',
      :valid_date_check => "(date.getMonth()+1) == #{date.month}" }
  end
  
  def remote_expenses_form(expense, form_id, &block)
    remote_form_for expense, 
      :url => { :action => expense.new_record? ? "create" : "update", :id => form_id }, 
      :html => {:id => form_id}, 
      :loading => show_indicator('expense-indicator'), 
      :complete => hide_indicator('expense-indicator'),
      &block
  end
  
  def expenses_history_chart(year = Date.today.year)
    
    expense_sums = Expense.sums_by_month(year)
    expense_min, expense_max = chart_value_range(expense_sums)
    
    expense_avg = non_zero_average(expense_sums)
    
    grid_interval = chart_grid_interval(expense_max)
    range_interval = chart_range_interval(expense_max)
    
    custom = {}
    custom["chbh"] = "a"
    custom["chma"] = default_chart_margins
    custom["chxs"] = "0,414751,8,0|1,414751,9,1"
    custom["chxr"] = "1,#{expense_min},#{expense_max},#{range_interval}"
    custom["chg"]  = "0,#{grid_interval},2,2"
    custom["chxl"] = "0:|#{chart_month_labels}"
    
    label_axis = ["x", "y"]
    unless expense_avg.nil?
      label_axis << "r"
      custom["chxl"] <<= "|2:|-%.1f" % expense_avg
      custom["chxp"] = "2,#{scale_chart_value(expense_avg, expense_max)}"
      custom["chxs"] <<= "|2,414751,8"
      custom["chxtc"] = "2,-#{default_chart_width}"
    end
    
    Gchart.bar(
      :size => default_chart_size,
      :data => expense_sums,
      :format => 'image_tag',
      :bg => "00000000",
      :bar_colors => "A8B25F",
      :alt => "Expense History",
      :axis_with_labels => label_axis,
      :custom => chart_options_to_params(custom),
      :max_value => expense_max)
  end
  

end
