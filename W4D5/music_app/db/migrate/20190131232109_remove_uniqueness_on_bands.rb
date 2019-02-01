class RemoveUniquenessOnBands < ActiveRecord::Migration[5.2]
  def change
    remove_index :albums, :band_id
  end
end
