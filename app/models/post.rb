class Post < ApplicationRecord
	validates_presence_of :titulo, :conteudo, :message => "não pode ser vazio"
	after_create :markdown

	def markdown
		MarkdownWorker.perform_async(self.id, self.titulo, self.conteudo)
	end
end
