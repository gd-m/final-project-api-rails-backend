class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :first_name, :last_name
  attribute :books do |user|
    {
      books: user.books
    }
  end

  attribute :notes do |user|
    {
      notes: user.notes
    }
  end

  has_many :books, serializer: BookSerializer
  has_many :notes, serializer: NoteSerializer
end
