class User < ApplicationRecord
    has_secure_password
    has_many :books
    has_many :notes

    validates_presence_of :username, :password, :first_name, :last_name
end
