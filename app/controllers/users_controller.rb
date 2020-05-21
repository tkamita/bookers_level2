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
		@user = User.find(params[:id])
	end
	def update
		
	end
	def destroy
		
	end

	private
		def user_params
			params.require(:book).permit(:name, :introduction, :profile_image)
		end
end
