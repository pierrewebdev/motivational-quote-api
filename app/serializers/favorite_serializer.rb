class FavoriteSerializer < ActiveModel::Serializer
  attributes :id,:quote
  belongs_to :user
  belongs_to :quote
end
