class PostsController < ApplicationController
	def index
		@posts = Post.all.order('created_at DESC')
	end

	def new

	end

	def create
		# first we create a post in memory
		@post = Post.new(post_params)
		# then we save the post to the db
		@post.save
		# finally we redirect back to the new post
		redirect_to @post
	end

	def show
		# the (params[:id]) will take the id number form the posts/4 and pass it in.
		@post = Post.find(params[:id])
	end

	private
		#new Rails 4.2 security feature. You must specifiy which parameters you want to allow.
		def post_params
			params.require(:post).permit(:title, :body)
		end
end
