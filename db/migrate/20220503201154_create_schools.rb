class CreateSchools < ActiveRecord::Migration[6.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :image_url
      t.boolean :is_hbcu
      t.timestamps
    end
  end
end
