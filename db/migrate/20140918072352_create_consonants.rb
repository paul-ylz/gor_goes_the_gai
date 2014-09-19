class CreateConsonants < ActiveRecord::Migration
  def change
    create_table :consonants do |t|
      t.string :consonant, null: false
      t.string :consonant_class, null: false
    end
  end
end
