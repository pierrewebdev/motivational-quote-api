class QuotesController < ApplicationController
    def index
        quotes = Quote.all
        render json: quotes
    end

    def show
        quote = Quote.find(params[:id])
        render json: quote, status: 200
    end
end
