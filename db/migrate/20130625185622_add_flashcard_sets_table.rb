class AddFlashcardSetsTable < ActiveRecord::Migration
  def change
    create_table :flashcard_sets do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
