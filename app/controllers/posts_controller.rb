class PostsController <ApplicationController
  def show
    #byebug
    @post=Post.find(params[:id])
   # @comments= @article.comments.order('comments.created_at DESC')
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
    #render plain: params[:article]
    @post= Post.new(params.require(:post).permit(:title, :description))
    @post.user=current_user
    #render plain: @article
    #render plain: @article.inspect
      if @post.save   #redirect_to article_path(@article)
         redirect_to @post
      else
         render 'new'
      end
  end

  def update
    @post = Post.find(params[:id])
      if  @post.update(params.require(:post).permit(:title, :description))
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
