module BalanceHelper
  
  include ChartHelper
  
  def month_has_transactions? month
    Expense.by_month(month).count > 0 or Payment.by_month(month).count > 0
  end
  
  def invalidate_month_balance_cache(date)
    expire_fragment("month-balance-%s-%s" % [date.year, date.month])
  end
  
  
  def user_delta_histroy_chart(user = current_user, year = Date.today.year)
    
    delta_data = (1..12).map do |month| 
      date = Date.civil(year, month)
      user.delta_until(date)
    end
    
    delta_min, delta_max = chart_value_range(delta_data, true)
    delta_range = delta_max - delta_min
    
    delta_data = scale_chart_values(delta_data, delta_max, delta_min)
    zero_data = scale_chart_values(Array.new(12, 0.0), delta_max, delta_min)

    # Custom options
    custom = {}

    # Bar width and spacing (automatic)
    custom["chbh"] = "a"
    
    # X-Axis Range
    range_interval = chart_range_interval(delta_range)
    custom["chxr"] = "1,#{delta_min},#{delta_max},#{range_interval}"
    
    # Margins
    custom["chma"] = default_chart_margins
    
    # Grid lines
    # chg=
    # <x axis step size>,
    # <y axis step size>,
    # <length of line segment>,
    # <length of blank segment>
    # <x offset>,
    # <y offset>
    grid_interval = chart_grid_interval(delta_range)
    custom["chg"] = "#{100.0/11},#{grid_interval},2,2"

    # Axis styles
    custom["chxs"] = "0,414751,8,0|1,414751,9,1"
    
    # Fill area
    # b,<color>,<start line index>,<end line index>,<any value>
    custom["chm"] = "b,C7D99CA0,0,1,0"
    
    # Marker types
    # <marker type>,<color>,<data set index>,<data point>,<size>,<priority>
    # custom << "|o,A8B25F,0,-1,4"
    
    # Line styles
    # chm=D,<color>,<data set index>,<data point>,<size>,<priority>
    custom["chm"] <<= "|D,A8B25F,0,0,2"
    
    #if Date.today.year == year
    #  custom["chm"] <<= "|V,A8B25F,0,#{Date.today.month-1},1"
    #end
    
    Gchart.line(
      :size => '261x100',
      :data => [delta_data, zero_data],
      :format => 'image_tag',
      :bg => "00000000",
      :bar_colors => ["00000000", "00000000"],
      :alt => "User Balance History",
      :axis_with_labels => ["x", "y"],
      :axis_labels => chart_month_labels,
      :custom => chart_options_to_params(custom),
      :encoding => :text)
  end
  
end
