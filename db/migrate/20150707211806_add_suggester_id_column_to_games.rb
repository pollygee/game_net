class AddSuggesterIdColumnToGames < ActiveRecord::Migration
  def change
    add_column :games, :suggester_id, :integer
  end
end
