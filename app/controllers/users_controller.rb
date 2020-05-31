class UsersController < ApplicationController
	before_action :authenticate_user!


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
    	if @user != current_user
        	redirect_to user_path(current_user)
    	end
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user.id), notice: 'successfully updated'
		else
			render action: :edit
		end
	end
	def destroy
		
	end


	private
		def user_params
			params.require(:user).permit(:name, :introduction, :profile_image)
		end
end
