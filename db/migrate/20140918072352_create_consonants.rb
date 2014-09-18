class CreateConsonants < ActiveRecord::Migration
  def change
    create_table :consonants do |t|
      t.string :char, null: false
      t.string :char_class, null: false
    end
  end
end
