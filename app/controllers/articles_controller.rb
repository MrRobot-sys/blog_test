class ArticlesController < ApplicationController
  # можно так - перед действием забрать и через ||= (инициализацию) присвоить переменной Класса ArticlesController
  # значение и потом оно будет доступно в других методах
  # before_action :scope, :resource

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by(id: params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(permitted_params)
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end


  private

  def permitted_params
    params.require(:article).permit(:name, :body)
  end
  # один ресурс - один объект
  def resource
    # params - доступен в контроллере
    @resource ||= Article.find_by(id: params[:id])
  end

  def scope
    @articles ||= Article.all
  end
end

