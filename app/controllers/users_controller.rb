class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user, status: 200
    end

    def login
        username = loginParams[:username]
        password = loginParams[:password]
        user = User.find_by(username:username)

        #check with bcrypt to make sure the password is correct
        #if correct send json of user data
        #else send an error message as json
        if user.authenticate(password)
            render json: user, status:200
        else
            render json: {error_message:"Incorrect Username or Password", status:400}
        end
    end

    private

    def loginParams
        params.permit(:username,:password)
    end
end
