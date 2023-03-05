class ArticlesController < ApplicationController
  # Testing Git
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.find(session[:user_id]) #User.first
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render :new
    end
    # @article ->article_path(article)-> these both will redirect to /articles/:id (you can view this order by rails route)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title,:body,:avatar)
  end

end
