class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :content
      t.user :belongs_to
      t.book :belongs_to

      t.timestamps
    end
  end
end
