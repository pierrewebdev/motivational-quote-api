class UserSerializer < ActiveModel::Serializer
  attributes :id,:full_name,:age
  has_many :quotes
  has_many :favorites
end
