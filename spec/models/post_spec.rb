require 'rails_helper'

RSpec.describe Post, type: :model do
	it 'Requer titulo para o post' do
		@post = Post.new(:titulo => nil)
		expect(@post).to_not be_valid
		@post.errors[:titulo].first.eql? "não pode ser vazio"
	end

	it 'Requer conteudo para o post' do
		@post = Post.new(:conteudo => nil)
		expect(@post).to_not be_valid
		@post.errors[:conteudo].first.eql? "não pode ser vazio"
	end

	it 'Deve processar o conteudo em markdown e retornar em html' do
		@post = Post.new(:titulo => "Links", :conteudo => "Esses são os *links*")
		@post.save!
		expect(@post.conteudo).to eq("Esses são os *links*")
	end
end
