class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :course, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
