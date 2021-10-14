class PostsController <ApplicationController

  #before_action :set_post, only: [:show,:edit,:update,:destroy]
  before_action :authenticate_user!, except: [:index,:show]

  def show
    #byebug
    @post=Post.find(params[:id])

    @comments=@post.comments
  end

  def index
    @posts =Post.paginate(page: params[:page], per_page: 5)
  end

  def new
    @post= Post.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def create
   
    @post= Post.new(params.require(:post).permit(:title, :description, :image,:private))
    @post.user=current_user
  
      if @post.save   
         redirect_to @post
      else
         render 'new'
      end
  end

  def update
    @post = Post.find(params[:id])
      if  @post.update(params.require(:post).permit(:title, :description, :image, :private))
       #flash[:notice] = "Article was updated successfully."
       redirect_to @post
      else
        render 'edit'
      end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path 
 end
 
end
