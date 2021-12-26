class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        #params
        # => {"authenticity_token"=>"[FILTERED]", "user"=>{"email"=>"email@email.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"specified text"}

        #params[:user]
        # => {"email"=>"email@email.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
        
        #render plain: params[:user]
        @user = User.new(user_params)
        if @user.save
            #using cookies to store user info, you can use "cookies[:user_id] but this is unencrypted and can cause security issues with people changing/accessing the private info on it"
            #instead use session cookies to encrypt the data "session[:user_id], it is set server side so browser cannot tamper with it"
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Account Creation Successful"
        else
            # flash[:alert] = "Something was wrong"
            render :new
        end
    end

    private

    def user_params
        #params.require(:user) is like params[:user] except it returns an error if user is not found
        #permit will allow only those attributes for modification, so that a user cant change maybe an admin field
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end