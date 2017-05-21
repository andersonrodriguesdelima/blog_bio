require 'rails_helper'

RSpec.describe Usuario, type: :model do
	it 'requer nome do usuario' do
		@user = Usuario.new(:nome => nil)
		expect(@user).to_not be_valid
		expect(@user.errors[:nome]).to include("não pode ser vazio. Máximo de 50 letras.")
	end
	it 'requer password do usuario' do
		@user = Usuario.new(:password => nil)
		expect(@user).to_not be_valid
		expect(@user.errors[:password]).to include("não pode ser vazio. Minimo de 6 caracteres.")
	end
	it 'requer email do usuario' do
		@user = Usuario.new(:email => nil)
		expect(@user).to_not be_valid
		expect(@user.errors[:email]).to include("não pode ser vazio.")
	end
	it 'requer que email siga a formatação' do
		@user = Usuario.new(:email => "andersonrodriguesdelima")
		expect(@user).to_not be_valid
		expect(@user.errors[:email]).to include("inválido. Digite um e-mail válido.")
	end
	it 'Deve haver somente um usuario por email' do
		@user = Usuario.new(
			:nome => "Anderson",
			:email => "anderson@bio.com.br",
			:password => "123456",
			:password_confirmation => "123456"
			)
		@user.save!
		@user_error = Usuario.new(
			:nome => "Anderson",
			:email => "anderson@bio.com.br",
			:password => "123456",
			:password_confirmation => "123456"
		)
		expect(@user_error.save).to be false
		expect(@user_error.errors[:email]).to include("já está em uso. Favor registrar outro e-mail.")
	end
	it 'Deve colocar email em downcase' do
		@user = Usuario.new(
			:nome => "Anderson",
			:email => "ANDERSON@BIO.COM.BR",
			:password => "123456",
			:password_confirmation => "123456"
			)
		expect(@user.save!).to be true
		expect(@user.email).to eq("anderson@bio.com.br")
	end
end
