class AddTypeToGenres < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :type, :string
  end
end
