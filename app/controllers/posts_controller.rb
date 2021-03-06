class PostsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :set_post, only: [:edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    params[:page] ||= 1

    begin
      @posts = ButterCMS::Post.all(page: params[:page], page_size: 5)
      @next_page = @posts.meta.next_page
      @prev_page = @posts.meta.previous_page
    rescue SocketError
      @posts = []
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    begin
      @post = ButterCMS::Post.find(params[:slug])
    rescue SocketError
      @post = nil
    end
    @post_url = "http://www.tmobaird.io/posts/#{@post.slug}"
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.admin_id = current_admin.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def markdown
    parsed_html = Post.parse_markdown(params[:content])
    respond_to do |format|
      format.json { render json: { parsed_html: parsed_html } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.friendly.find(params[:slug])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :tags, :body, :published)
  end
end
