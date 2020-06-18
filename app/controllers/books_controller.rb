class BooksController < ApplicationController
  	before_action :authenticate_user!

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			redirect_to book_path(@book), notice: 'successfully created'
		else
			@user = current_user
			@books = Book.all
			render action: :index
		end
	end

	def index
		@books = Book.all
		@user = current_user
		@book = Book.new
		@users = User.all
	end
	def show
		@book = Book.find(params[:id])
		@user = current_user
		@book_comment = BookComment.new
	end
	def edit
		@book = Book.find(params[:id])
	    if @book.user != current_user
        	redirect_to books_path
    	end
	end
	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(@book.id), notice: 'successfully updated'
		else
			render action: :edit
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end


	private
		def book_params
			params.require(:book).permit(:title, :body)
		end

	  	def correct_user
		    @book = Book.find(params[:id])
		    if currect_user != @book.user
		       redirect_to user_path(currect_user)
		    end
	  	end
end





