module ApplicationHelper
  def flash_class(level)
    case level
    when 'notice' then 'bg-blue-100 border-blue-400 text-blue-700'
    when 'success' then 'bg-green-100 border-green-400 text-green-700'
    when 'error' then 'bg-red-100 border-red-400 text-red-700'
    end
  end

  def icon_class(level)
    case level
    when 'notice' then 'text-blue-500'
    when 'success' then 'text-green-500'
    when 'error' then 'text-red-500'
    end
  end
end
