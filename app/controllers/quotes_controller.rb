class QuotesController < ApplicationController
    def index
        byebug
        quotes = Quote.all
        render json: quotes
    end

    def show
        quote = Quote.find(params[:id])
        render json: quote, status: 200
    end
end
