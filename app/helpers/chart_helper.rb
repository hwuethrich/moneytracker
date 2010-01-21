module ChartHelper
  
  def scale_chart_value(val, max, min=0.0)
    val = val.to_f; max = max.to_f; min = min.to_f;
    (val - min) / (max - min) * 100.0
    #(100.0 / max) * val
  end
  
  def scale_chart_values(vals, max, min=0.0)
    vals.map { |v| scale_chart_value(v, max, min) }
  end
  
  def chart_value_range(values, fix_zero=true)
    max = values.max
    min = values.min
    
    min = 0.0 if min > 0 && fix_zero
    max = 0.0 if max < 0 && fix_zero
    
    interval = chart_range_interval(max - min)
    max = (max / interval).ceil * interval if max > 0
    min = (min / interval).floor * interval if min < 0
    
    if min == max
      min -= 100 unless fix_zero
      max += 100
    end
    
    [min, max]
  end
  
  def chart_month_labels
    I18n.t("date.abbr_month_names").compact.join("|")
  end
  
  def default_chart_height
    100
  end
  
  def default_chart_width
    261
  end
  
  def default_chart_size
    "#{default_chart_width}x#{default_chart_height}"
  end
  
  def default_chart_margins
    "30,10,10,10"
  end
  
  def chart_grid_interval(max, min=0)
    scale_chart_value(chart_range_interval(max - min), max, min)
  end
  
  def non_zero_average values
    values = values.select { |x| x > 0.0 }
    values.empty? ? nil : values.sum / values.size
  end
  
  def chart_range_interval range
    case range
      when       0..5 then 1
      when      5..10 then 2
      when     10..40 then 5
      when     40..80 then 10
      when    80..150 then 20
      when   150..180 then 25
      when   180..400 then 50
      when   400..800 then 100
      when  800..1800 then 200
      when 1800..4000 then 500
      else 1000
    end
  end
  
  def chart_options_to_params opts
    opts.map { |k,v| "#{k}=#{v}" }.join("&")
  end
end