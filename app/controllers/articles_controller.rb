class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_path(@article), notice: "Article was successfully created."
    else
      render :new, alert: "Article could not be created."
    end
  end

  private

  def article_params
    params.require(:article).permit(
      :title,
      :description,
      :price,
    )
  end
end
