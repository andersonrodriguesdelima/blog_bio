class MarkdownWorker
	include Sidekiq::Worker
	sidekiq_options retry: false

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
		post.titulo = m.render(post_titulo)
		post.conteudo = m.render(post_conteudo)
		post.save!
		sleep 2
	end
end