class CommentsController < ApplicationController
	before_action :set_post
	
	# def new
	# 	debugger
	# 	@comment = @post.comments.new
	# end

	def create
		@comment = @post.comments.new(comment_params)
		respond_to do |format|
			if @comment.save
				format.html {redirect_to posts_path }
				format.js
			else
				format.html { render 'new'}
				format.js
			end
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:comment,:post_id)
	end

	def set_post
		if params[:post_id]
			@post = Post.find(params[:post_id])
		else
			@post = Post.find(params[:comment][:post_id])
		end
	end
	
end
