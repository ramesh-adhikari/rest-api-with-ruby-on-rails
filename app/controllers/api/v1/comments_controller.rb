class Api::V1::CommentsController < ApplicationController

	# GET /comments
	def index
		@comments = Comment.all
		render json: @comments
	end

	# GET /comments/:id
	def show
		@comment = Comment.find(params[:id])
		render json: @comment
	end

	# POST /comments
	def create
		@comment = Comment.new(comment_params)
		if  @comment.save
			render json: @comment
		else
			render error: {error: 'Unable to create Comment'}, status:400
		end
	end

	# PUT /comments/:id
	def update
		@comment = Comment.find(params[:id])
		if @comment
			 @comment.update(comment_params)
			render json: {message: 'Comment successfully updated.'}, status:200
		else
			render json: {error: 'Unable to update psot.'}, status:400
			
		end
		
	end

	# DELETE /comments
	def destroy
		@comment = Comment.find(params[:id])
		if @comment
			 @comment.destroy
			render json: {message: "Comment successfully deleted."}, status: 200
		else
			render json: {error: 'Unable to delete Comment.'}, status: 400
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:comment,:commented_by,:post_id)
	end
end
