class UsersController < ApplicationController
    before_action :authorized, only: [:keep_logged_in]

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
        if user && user.authenticate(password)
            user_token = encode_token({user_id:user.id})
            render json: {user:UserSerializer.new(user),token:user_token}
        else
            render json: {error_message:"Incorrect Username or Password", status:400}
        end
    end

    def keep_logged_in
        byebug
        puts "HIT ME BABY ONE MORE TIME"
    end

    def create
        permitted_params = registerParams
        new_user = User.create(
            :first_name => permitted_params[:firstName],
            :last_name => permitted_params[:lastName],
            :username => permitted_params[:username],
            :age => permitted_params[:age],
            :password => permitted_params[:password]
        )
        
        if new_user.valid?
            user_token = encode_token({user_id:new_user.id})
            render json: {user:UserSerializer.new(new_user),token:user_token}
        end
        

    end

    private

    def loginParams
        params.permit(:username,:password)
    end

    def registerParams
        params.permit(:username,:password,:firstName,:lastName,:age)
    end
end
