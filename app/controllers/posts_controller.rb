class PostsController < ApplicationController
	def index
		@posts = Post.all.order('created_at DESC')
	end

	def show
		# the (params[:id]) will take the id number form the posts/4 and pass it in.
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		# first we create a post in memory
		@post = Post.new(post_params)
		# then we save the post to the db
		if @post.save
			# finally we redirect back to the new post
			# redirect does an entirely new http refresh
			redirect_to @post
		else
			# else we render the new method 
			# using render it does do an entirely new http refresh and will keep all entered content in-place on form on an error.
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])		
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			# render the edit form
			render 'edit'
			# need to add an edit view and form. we'll use the same form as new and edit also  we'll convert it to a partial. create a new file edit.hrml.erb + _form.html.erb
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to root_path
	end

	private
		#new Rails 4.2 security feature. You must specifiy which parameters you want to allow.
		def post_params
			params.require(:post).permit(:title, :body)
		end
	end
