class ArticlesController < ApplicationController
  skip_before_action :authorize!, only: [:index, :show]

  def index
    articles = Article.recent.
      page(params[:page]).
      per(params[:per_page])
    render json: articles
  end

  def show
    render json: Article.find(params[:id])
  end

  def create
    article = Article.new(article_params)
    article.save!
    render json: article, status: :created
  rescue
    render json: article, adapter: :json_api, serializer: ErrorSerializer, status: :unprocessable_entity
  end

  def update
    article = Article.find(params[:id])
    article.update_attributes!(article_params)
    render json: article, status: :ok
  rescue
    render json: article, adapter: :json_api, serializer: ErrorSerializer, status: :unprocessable_entity
  end

  private

  def article_params
    params.require(:data).require(:attributes).permit(:title, :content, :slug)
  end
end
