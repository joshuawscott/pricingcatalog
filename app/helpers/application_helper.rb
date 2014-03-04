module ApplicationHelper
  def num_to_cur(*args)
    return "None" if args[0].nil? || args[0] < 0
    number_to_currency *args
  end
end
