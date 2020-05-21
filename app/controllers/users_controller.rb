class UsersController < ApplicationController
	def create
		
	end
	def index
		
	end
	def show
		@user = User.find(params[:id])
		@books = @user.books.page(params[:page]).reverse_order
	end
	def edit
		
	end
	def update
		
	end
	def destroy
		
	end
end
