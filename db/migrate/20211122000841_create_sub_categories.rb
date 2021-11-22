class CreateSubCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_categories do |t|

      t.string :name, :description
      t.timestamps

      t.references :category, index: true

    end
  end
end
