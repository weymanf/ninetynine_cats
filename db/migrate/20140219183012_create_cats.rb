class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :age
      t.string :birthdate
      t.string :color
      t.string :name
      t.string :sex

      t.timestamps
    end
  end
end
