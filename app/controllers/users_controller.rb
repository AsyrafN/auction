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
			render :new
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

	def sign_out
	    session[:user_id] = nil
	    redirect_to '/sign_in'
	end

	def create_from_omniauth
	  auth_hash = request.env["omniauth.auth"]
	  authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

	  # if: previously already logged in with OAuth
	  if authentication.user
	    user = authentication.user
	    authentication.update_token(auth_hash)
	    @next = root_url
	    @notice = "Signed in!"
	 
	 else
	    user = User.create_with_auth_and_hash(authentication, auth_hash)
	   
	    
	  end

	  session[:user_id] = user.id
	  redirect_to root_path
	end

	private
	  def user_params
	    params.require(:user).permit(:email, :password, :first_name, :last_name)
	end
end
