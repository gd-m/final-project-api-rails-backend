class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
   def index
    if logged_in?
      @users = User.all
 
      #render json: @users
      users_json = UserSerializer.new(@users)
      render json: users_json
     else
       render json: {
         error: "Please Login or SignUp"
        }
      end
   end

  # # GET /users/1
   def show
    if logged_in?
      # render json: @user
      user_json = UserSerializer.new(@user).serialized_json
 
      render json: user_json
     else
       render json: {
         error: "Please Login or SignUp"
       }
     end
   end

  # POST /users
  def create
   
    @user = User.new(user_params)
    byebug
      if @user.save
        session[:user_id] = @user.id
        user_json = UserSerializer.new(@user).serialized_json
  
       render json: user_json, status: :created
      else

        res = {
          error: @user.errors.full_messages.to_sentence
        }
  
       render json: res, status: :unprocessable_entity
      end
    
  end

  # PATCH/PUT /users/1
  def update
    if logged_in?
      if @user.update(user_params)
        user_json = UserSerializer.new(@user).serialized_json
  
       render json: user_json
      else
        user_json = UserSerializer.new(@user).serialized_json
  
       render json: user_json.errors, status: :unprocessable_entity
      end
    else
      render json: {
        error: "Please Login or SignUp"
      }
    end
  end

  # DELETE /users/1
  def destroy
    if logged_in?
      @user.destroy
    else
      render json: {
        error: "Please Login or SignUp"
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :password)
    end
end
