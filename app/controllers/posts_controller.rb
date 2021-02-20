class PostsController < ApplicationController

	def index
		# @posts = Post.all

		@posts = Post.all.includes(:comments)
		
		# @comment = Comment.all.last
		# if @comment.present?
		# 	@comment = Post.find(@comment.post_id)
		# end
	end

	def new
		@post = Post.new
	end

	def create
		@posts = Post.all
		@post = Post.create(post_params)
		@post_last = Post.last
		respond_to do |format|
			if @post.save
	
				  format.html { redirect_to posts_path}#handle HTML, i.e. full page reload 
				  format.js {} # handle ajax request
			else
				format.html { render 'new'}
				format.js { }	
			end
		end	
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		respond_to do |format|
			if @post.update(post_params)
				format.html { redirect_to @post}
				format.js {}
				# redirect_to @post
			else
				render 'edit'
			end
		end
	end

	def sub_category
		debugger
	end

	private
	def post_params
		params.require(:post).permit(:title,:body)
	end
end
