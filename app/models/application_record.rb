class ApplicationRecord < ActiveRecord::Base
	self.abstract_class = true

	def markdown(text)
		options = {
			filter_html:     true,
			hard_wrap:       true,
			link_attributes: { rel: 'nofollow', target: "_blank" },
			space_after_headers: true,
			fenced_code_blocks: true
		}

		extensions = {
			autolink:           true,
			superscript:        true,
			disable_indented_code_blocks: true
		}

		renderer = Redcarpet::Render::HTML.new(options)
		markdown = Redcarpet::Markdown.new(renderer, extensions)
		m = Redcarpet::Markdown.new(renderer)
		m.render(text).html_safe
	end
end
