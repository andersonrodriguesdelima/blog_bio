require 'rails_helper'

RSpec.describe Post, type: :model do
	it 'Requer titulo para o post' do
		@post = Post.new(:titulo => nil)
		expect(@post).to_not be_valid
		expect(@post.errors[:titulo]).to include("não pode ser vazio")
	end

	it 'Requer conteudo para o post' do
		@post = Post.new(:conteudo => nil)
		expect(@post).to_not be_valid
		expect(@post.errors[:conteudo]).to include("não pode ser vazio")
	end

	it 'Deve processar o conteudo em markdown e retornar em html' do
		@user = Usuario.new(:nome => "anderson", :email => "anderson@bio.com.br", :password => "123456", :password_confirmation => "123456")
		@user.save!
		@post = Post.new(:titulo => "Links", :conteudo => "Esses são os *links*", :usuario_id => @user.id)
		@post.save!
		expect(@post.conteudo).to eq("Esses são os *links*")
	end
end
