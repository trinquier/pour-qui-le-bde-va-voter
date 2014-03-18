class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :admin
      t.references :item
      t.text :content

      t.timestamps
    end
  end
end
