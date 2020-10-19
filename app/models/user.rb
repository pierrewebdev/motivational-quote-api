class User < ApplicationRecord
    has_secure_password

    #these are quotes that were written by the user
    has_many :quotes
    #these are quotes that the user did not write but added to favorites
    has_many :favorites

    def full_name
        user_full_name = "#{self.first_name} #{self.last_name}"
        user_full_name
    end
end
