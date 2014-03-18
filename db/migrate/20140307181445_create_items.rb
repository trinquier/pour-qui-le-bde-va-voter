class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :list
      t.integer :points

      t.timestamps
    end
  end
end
