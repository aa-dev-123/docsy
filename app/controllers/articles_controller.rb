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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Article was successfully updated." }
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      respond_to do |format|
        format.html { redirect_to article_path(@article), notice: "Article was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Article was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Quote was successfully destroyed." }
    end
  end
 
  private

  def article_params
    params.require(:article).permit(
      :title,
      :description,
      :document,
      :price,
    )
  end
end
