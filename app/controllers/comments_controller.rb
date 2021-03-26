class CommentsController < ApplicationController
  before_action :authorized_user?

  def create
    @user = User.find(current_user.id)

    if !authorized_user?
      redirect_to signup_path and return
    else
      begin
        comm = Comment.create!(comment_params.merge(user_id: current_user.id))
      rescue => error
        render json: {
          user: current_user.id,
          e: error
        }
      end
      render json: {
        status: :created,
        user: comm
      }

    end
  end

  def show
    @user = User.find(current_user.id)

    if !authorized_user?
      redirect_to signup_path and return
    else

      comment = Comment.find(params[:artice_id])
      render json: {
        status: :ok,
        comment: comment,
      }
    end
  end

  def delete
    @user = User.find(current_user.id)

    if !authorized_user?
      redirect_to signup_path and return
    else

      comment = Comment.find_by(article_id: params[:artice_id])
      if comment&.user_id == current_user&.id
        comment.delete

        render json: {
          status: :deleted,
        }

      else
        render json: {
          status: :forbidden,
        }

      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :article_id)
  end

end