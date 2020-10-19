# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#A link to a quote api, need to call it a few times
require "csv"
# Favorite.delete_all
# Favorite.reset_pk_sequence
Quote.delete_all
Quote.reset_pk_sequence
User.delete_all
User.reset_pk_sequence


################################################################
#method to parse quote csv file
def parse_quotes_csv_file
    csv_data = CSV.read("db/quotes_for_generator.csv")
    #get rid of tthe column names from the file
    csv_data.shift

    quote_object_array = []
    csv_data.each do |quote_row_arr|
        quote_object = {
           :content => quote_row_arr[0],
           :author => quote_row_arr[1],
        }
            quote_object_array.push(quote_object)  
    end
    quote_object_array.flatten
end


#Populate User Table
patrick = {
    :first_name => "Patrick",
    :last_name => "Pierre",
    :age => 24,
    :username => "pierrewebdev",
    :password => "abc123"
}
User.create(patrick)
#Populate Quote Table
Quote.create!(parse_quotes_csv_file)


#Populate Favorite Table
#Favorite.create(quote_id:Quote.first.id)



puts "I SEEDED THE DATABASE!"
