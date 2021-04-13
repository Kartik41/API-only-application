class Api::V1::PostsController < ApiController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    @posts = Post.find(params[:id])
    render json: @posts
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post 
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    render plain: "OK" 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
