# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to article_path(@article)
  end

  def edit
    # @article = article.find(params[:id])
  end

  def update
    # @article = article.find(params[:id])
    @article.update(article_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to article_path(@article)
  end

  def destroy
    # @article = article.find(params[:id])
    @article.destroy
    # No need for app/views/articles/destroy.html.erb
    redirect_to articles_path, status: :see_other
  end

  def show
    # @article = article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
