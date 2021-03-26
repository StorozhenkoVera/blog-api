class ArticlesController < ApplicationController
  before_action :authorized_user?

  def index
    @user = User.find(current_user.id)

    if !authorized_user?
      redirect_to signup_path and return
    else

      articles = Article.all.select(:title, :body, :category, :created_at)
      articles.map do |item|
        item.body = item.body.length > 500 ? '...' : item.body
      end

      render json: {
        status: :ok,
        articles: articles
    }
    end
  end

  def show
    article = Article.find(params[:id])
    render json: {
      status: :ok,
      title: article.title,
      body: article.body,
      category: article.category,
      created_at: article.created_at
    }
  end

  def create
    @user = User.find(current_user.id)

    if !authorized_user?
      redirect_to signup_path and return
    else
      begin
        Article.create!(article_params)
      rescue => error
        render json: {
          user: current_user.id,
          e: error
        }
      end
      render json: {
        status: :created,
        user: @user
      }

    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :category)
    end
end