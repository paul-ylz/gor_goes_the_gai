class CreateAlphabet < ActiveRecord::Migration
  def change
    create_table :alphabets do |t|
      t.string :alphabet, null: false
    end
    create_table :consonants do |t|
      t.integer :alphabet_id, null: false
      t.string :consonant_class, null: false
    end
    add_index :alphabets, :alphabet, unique: true
    add_index :consonants, [:alphabet_id, :consonant_class], unique: true
  end
end
