class BlogsController < ApplicationController

  before_action :params_id, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blog_params)

    if @blog.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @blog.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private 

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def params_id
    @blog = Blog.find(params[:id])
  end

end
