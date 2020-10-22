class QuotesController < ApplicationController
    before_action :authorized, only: [:create,:delete,:update]

    def index
        quotes = Quote.all
        render json: quotes
    end

    def show
        quote = Quote.find(params[:id])
        render json: quote, status: 200
    end

    def create
       new_quote = @user.quotes.create(quote_params)
       render json: new_quote
    end

    def update
        #logic
    end

    def delete
        quoteToDelete = Quote.find(params[:id])
        quoteToDelete.destroy
        
        render json: quoteToDelete
    end

    private

    def quote_params
        params.permit(:content,:author)
    end
end
