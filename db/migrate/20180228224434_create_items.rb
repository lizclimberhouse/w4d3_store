class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name, presence: true
      t.text :desc
      t.integer :price, numericality: { greater_than: 0 }
      t.belongs_to :department, foreign_key: true

      t.timestamps
    end
  end
end
