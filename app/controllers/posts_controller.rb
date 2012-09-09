class PostsController < ApplicationController
  respond_to :html, :json
  load_and_authorize_resource

  before_filter :find_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def create
    @post = Post.new(params[:post])
    @post.save ? flash_message(:notice) : flash_message(:error, msg: @post.errors.full_messages.to_sentence)
    respond_with(@post)
  end

  def update
    @post.update_attributes(params[:post]) ? flash_message(:notice) : flash_message(:error, msg: @post.errors.full_messages.to_sentence)
    respond_with(@post)
  end

  def destroy
    @post.destroy ? flash_message(:notice) : flash_message(:error, msg: @post.errors.full_messages.to_sentence)
    respond_with(@post)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
