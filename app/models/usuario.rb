class Usuario < ApplicationRecord
	has_secure_password
	has_many :posts

	validates_presence_of :nome, length: {maximum: 50}, :message => "não pode ser vazio. Máximo de 50 letras."
  	validates_presence_of :password, length: {minimum: 6}, :message => "não pode ser vazio. Minimo de 6 caracteres."
  	VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  	validates_presence_of :email, length: {maximum: 260}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}, :message => "não pode ser vazio."
  	
  	before_save do
  		self.email = email.downcase
  	end
end
