module ApplicationHelper

  def active_class(path)
    'class=active' if current_page?(path)
  end

  def active_class_wo_class(path)
    'active' if current_page?(path)
  end

end
