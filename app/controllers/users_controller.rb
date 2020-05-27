class UsersController < ApplicationController
	def create
		
	end
	def index
		@users = User.all
		@user = current_user
		@book = Book.new
	end
	def show
		@book = Book.new
		@books = Book.all
		@user = User.find(params[:id])
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end
	def destroy
		
	end

	private
		def user_params
			params.require(:user).permit(:name, :introduction, :profile_image)
		end
end
