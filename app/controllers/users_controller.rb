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

	def following
		@user  = User.find(params[:id])
		@users = @user.followings
		@book = Book.new
		render 'show_follow'
	end

	def followers
		@user  = User.find(params[:id])
		@users = @user.followers
		@book = Book.new
		render 'show_follower'
	end

	# def search
  #   if params[:name].present?
  #     @users = User.where('name LIKE ?', "%#{params[:name]}%")
  #   else
  #     @users = User.none
  #   end
	# end
	
	def search
		@user_or_book = params[:option]
		@how_search = params[:choice]
		if @user_or_book == "1"
			if params[:search].present?
				@users = User.search(params[:search], @user_or_book, @how_search)
			else
				@users = User.none
			end
		else
			if params[:search].present?
				@books = Book.search(params[:search], @user_or_book, @how_search)
			else
				@books = Book.none
			end
    end
  end


	private
		def user_params
			params.require(:user).permit(:name, :introduction, :profile_image)
		end
end
