require 'redcarpet'
module ApplicationHelper
    def markdown(text)

        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, tables: true, highlight: true, no_space_after_headers: true, underline: true,
        auto_link: true, quote: true)
        
        markdown.render(text).html_safe
    end
end
