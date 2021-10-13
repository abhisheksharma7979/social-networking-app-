class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    def show
    end
    def index
        @posts = Post.all
    end
    def new
        @post = Post.new
    end
    def edit
    end
    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:notice] = "Post was created successfully."
            redirect_to @post
          else
            render 'new'
          end
    end
    def update
        @post = Post.find(params[:id])
        if @post.update(params.require(:post).permit(:title, :description))
          flash[:notice] = "Post was updated successfully."
          redirect_to @post
        else
          render 'edit'
        end
      end
      def destroy
        @post.destroy
        redirect_to posts_path
      end
        private
        def set_post
            @post = Post.find(params[:id])
        end
        def post_params
            params.require(:post).permit(:title, :description)
        end
    end