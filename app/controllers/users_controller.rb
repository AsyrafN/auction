class UsersController < ApplicationController
	# skip_before_action:login_required,:only=>[:index]
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_path
		else
			render template: "/sign_up"
		end
	end

	def login
	 	user = User.find_by_email(params[:email])
	 	# p user
	 	# p params
	 	if user && user.authenticate(params[:password]) 
	 		session[:user_id] = user.id
		 		redirect_to "/"
	 	else
	 	  puts "failed"
	 	end
	end

	def sign_in
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path
		else
			render '/users/edit'
		end
	end

	def destroy
	    session[:user_id] = nil
	    redirect_to '/sign_in'
	end

	private
	  def user_params
	    params.require(:user).permit(:email, :password, :first_name, :last_name)
	end
end
