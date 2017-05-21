class Post < ApplicationRecord
	belongs_to :usuario
	validates_presence_of :titulo, :conteudo, :message => "não pode ser vazio"
	after_commit :markdown, :on => :create

	def markdown
		MarkdownWorker.perform_async(self.id, self.titulo, self.conteudo)
	end
end
