class Api::V1::PostsController < ApplicationController

	# GET /posts
	def index
		@posts = Post.all
		render json: @posts
	end

	# GET /posts/:id
	def show
		@post = Post.find(params[:id])
		render json: @post
	end

	# POST /posts
	def create
		@post = Post.new(post_params)
		if @post.save
			render json: @post
		else
			render error: {error: 'Unable to create Post'}, status:400
		end
	end

	# PUT /posts/:id
	def update
		@post = Post.find(params[:id])
		if @post
			@post.update(post_params)
			render json: {message: 'Post successfully updated.'}, status:200
		else
			render json: {error: 'Unable to update psot.'}, status:400
			
		end
		
	end

	# DELETE /posts
	def destroy
		@post = Post.find(params[:id])
		if @post
			@post.destroy
			render json: {message: "Post successfully deleted."}, status: 200
		else
			render json: {error: 'Unable to delete post.'}, status: 400
		end
	end

	private
	def post_params
		params.require(:post).permit(:title,:description)
	end

end
