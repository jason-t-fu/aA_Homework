class DeleteFalseColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :houses, :false
    remove_column :people, :false
    change_column_null :houses, :address, false
    change_column_null :people, :name, false
    change_column_null :people, :house_id, false
  end
end
