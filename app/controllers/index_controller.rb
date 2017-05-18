class IndexController < ApplicationController
	def home
		@posts = Post.all
	end

	def show_post
		@posts = Post.all
		@post = Post.find(params[:id])
	end
end
