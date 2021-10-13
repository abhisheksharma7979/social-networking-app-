class CommentsController < ApplicationController
    
    def new
      @comment=Comment.new
    end
    
    def create
      # byebug
      @comment=Comment.new(comment_params)
        if @comment.save
          flash[:notice]="Comment Successfully Added"
          redirect_to post_path(@comment.post_id)
          #redirect_back fallback_location: @post
        else
          flash.now[:alert]="Fill correct details"
              render 'new'
        end
  
    end
    
    def comment_params
      params.require(:comment).permit(:data,:post_id,:user_id)
    end
  
  end
  