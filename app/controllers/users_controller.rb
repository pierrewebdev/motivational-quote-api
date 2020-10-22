class UsersController < ApplicationController
    before_action :authorized, only: [:keep_logged_in,:update]

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
        #note we have access to user because that is what was originally used as the data to encode in the token
        user_token = encode_token({user_id:@user.id})
        render json: {
            user: UserSerializer.new(@user),
            token:user_token
        }
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

    def update
        #will reuse register params here because it the hash being sent to db has all the same keys
        @user.update(
            :first_name => registerParams[:firstName],
            :last_name => registerParams[:lastName],
            :username => registerParams[:username],
            :age => registerParams[:age],
        )

        render json:@user
    end

    private

    def loginParams
        params.permit(:username,:password)
    end

    def registerParams
        params.permit(:username,:password,:firstName,:lastName,:age)
    end
end
