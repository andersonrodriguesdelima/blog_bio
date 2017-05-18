class Post < ApplicationRecord
	before_create do
		self.titulo   = markdown(self.titulo)
		self.conteudo = markdown(self.conteudo)
	end

	before_update do
		self.titulo   = markdown(self.titulo)
		self.conteudo = markdown(self.conteudo)
	end
end
