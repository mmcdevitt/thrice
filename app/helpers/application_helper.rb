module ApplicationHelper

  def active_class(path)
    'class=active' if current_page?(path)
  end

  def active_class_wo_class(path)
    'active' if current_page?(path)
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      :autolink => true, :space_after_headers => true, :no_intra_emphasis => true, :strikethrough => true,
      :underline => true, :quote => true, :headers => true)
    markdown.render(text).html_safe
  end

end
