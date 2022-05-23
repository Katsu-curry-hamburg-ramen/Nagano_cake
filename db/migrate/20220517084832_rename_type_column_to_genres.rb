class RenameTypeColumnToGenres < ActiveRecord::Migration[6.1]
  def change
    rename_column :genres, :type, :genrename
  end
end
