module Api
  class ArticlesController < ApplicationApiController

    before_action :set_article, only: %i[ show update destroy ]

    def index
      @articles = Article.all
      render json: Serializers::Article.render_as_json(@articles)
    end

    def show
      render json: ArticleSerializer.render_as_json(@article)
    end

    def create
      @article = Article.new()

      if @article.save
        render json: ArticleSerializer.render_as_json(@article)
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end

    def update
      if @article.update(article_params)
        render json: ArticleSerializer.render_as_json(@article)
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @article.destroy
    end

    private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.exept(article: [:name, :body])
    end
  end
end