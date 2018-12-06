class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
  end

  def create
    @blog = Blog.create(blog_params)

    if @blog.save
      redirect_to root_path
    else
      render :new
    end
  end

  private 

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

end
