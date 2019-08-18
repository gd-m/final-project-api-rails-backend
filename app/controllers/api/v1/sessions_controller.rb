class Api::V1::SessionsController < ApplicationController
    def create
        @user = User.find_by(username: params[:session][:username])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            user_json = UserSerializer.new(@user).serialized_json
            render json: user_json
        else 
            render json: {
                error: "Invalid Credentials"
            }
        end
    end

    def get_current_user
        if logged_in?
            user_json = UserSerializer.new(current_user).serialized_json
            render json: user_json
        else
            render json: {
                error: "No on Logged In"
            }
        end
    end


    def destroy
        session.clear
        rendar json: {
            notice: "Logged out Successfully"
        }, status: :ok
    end
end
