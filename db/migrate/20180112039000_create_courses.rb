class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.references :school, foreign_key: true
      t.string :price
      t.string :term
      t.string :name

      t.timestamps
    end
  end
end
