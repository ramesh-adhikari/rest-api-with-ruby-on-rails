class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.text :comment
      t.string :commented_by

      t.timestamps
    end
  end
end
