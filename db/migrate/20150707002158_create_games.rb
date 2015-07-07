class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :secret_word
      t.string :letters_guessed

      t.timestamps null: false
    end
  end
end
