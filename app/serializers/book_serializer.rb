class BookSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :author, :notes
  has_many :notes
  belongs_to :user
end
