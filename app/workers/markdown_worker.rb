class MarkdownWorker
	include Sidekiq::Worker

	def perform(post_id, post_titulo, post_conteudo)
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
		post = Post.find(post_id)

		renderer = Redcarpet::Render::HTML.new(options)
		markdown = Redcarpet::Markdown.new(renderer, extensions)
		m = Redcarpet::Markdown.new(renderer)
		post.update_attribute(:conteudo, m.render(post_conteudo))
	end
end