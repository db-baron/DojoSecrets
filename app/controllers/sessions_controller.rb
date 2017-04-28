class SessionsController < ApplicationController
    def new
        # render login page
    end

    def register
        # render json: params

        user = User.create(user_params)

        if user.valid?
          session[:user_id] = user[:id]
          redirect_to "/dash"
        else
          render json: user.errors
        end
    end

    def logout
      session.delete(:user_id)
      redirect_to '/'
    end

    def create
        # Log User In
        # if authenticate true
            # save user id to session
            # redirect to users profile page
        # if authenticate false
            # add an error message -> flash[:errors] = ["Invalid"]
            # redirect to login page
    end

    def destroy
        # Log User out
        # set session[:user_id] to null
        # redirect to login page
    end

    def user_params
       params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
