class CreateServiceCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :service_categories do |t|
      t.string :name
      t.integer :service_id

      t.timestamps
    end
  end
end
