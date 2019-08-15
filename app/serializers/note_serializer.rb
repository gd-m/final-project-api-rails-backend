class NoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content
end
