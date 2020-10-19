class Quote < ApplicationRecord
  belongs_to :user, optional: true
  has_many :favorites
  #If I ever needed to access data from the users model from the quote model
  has_many :users, through: :favorites
end
