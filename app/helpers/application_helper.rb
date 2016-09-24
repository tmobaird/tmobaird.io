module ApplicationHelper
  def markdown_options
    {
      filter_html:     true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      prettify: true
    }
  end

  def markdown_extensions
    {
      autolink:           true,
      superscript:        true,
      fenced_code_blocks: true,
      highlight: true
    }
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(markdown_options)
    @markdown ||= Redcarpet::Markdown.new(renderer, markdown_extensions)

    @markdown.render(text).html_safe
  end
end
