class CreateAuthorships < ActiveRecord::Migration[7.0]
  def change
    create_table :authorships do |t|
      t.belongs_to :book, null: false, foreign_key: true
      t.belongs_to :author, null: false, foreign_key: true

      t.timestamps
    end

    add_index :authorships, [:book_id, :author_id], unique: true
  end
end
