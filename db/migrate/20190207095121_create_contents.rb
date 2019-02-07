class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title
      t.date :published_date
      t.string :author
      t.text :summary
      t.text :text
      t.integer :status
      t.index :status

      t.timestamps
    end
  end
end
