class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end
  # def create
  #   @book = Book.find(params[:book_id])
  #   #投稿に紐づいたコメントを作成
  #   @book_comment = @book.book_comments.build(book_comment_params)
  #   @book_comment.user_id = current_user.id
  #   @book_comment.save
  #   # render :index
  # end

  def destroy
    book_comment = BookComment.find(params[:format])
    book_comment.destroy
    redirect_back(fallback_location: root_path)
  end
  # def destroy
  #   @book_comment = BookComment.find(params[:id])
  #   @book_comment.destroy
  #   # render :index
  # end


  private

  def book_comment_params
    params.require(:book_comment).permit(:user_id, :book_id, :comment)
  end
end