class FavoritesController < ApplicationController
    before_action :authorized, only: [:create,:delete,:update]

    def index
        favorites = Favorite.all
        render json: favorites
    end

    # def show
    #     favorite = favorite.find(params[:id])
    #     render json: favorite, status: 200
    # end

    def create
        #I have the quote id from params and I have the @user instamce
        already_there =  Favorite.find_by(user:@user,quote_id:params[:id])
        if already_there
            render json: {error_message:"You already have this quote in your favorites"}
        else
            new_favorite = Favorite.create(user:@user,quote_id:params[:id])
            render json: new_favorite
        end
    end


    def delete
        if @user
            favoriteToDelete = Favorite.find(params[:id])
            favoriteToDelete.destroy
            render json: favoriteToDelete
        else
            render json: {error_message: "failed to delete favorite"}
        end
    end
end
