class Book < ApplicationRecord
    has_many :notes
    belongs_to :user

    validates_presence_of :title, :author
end
