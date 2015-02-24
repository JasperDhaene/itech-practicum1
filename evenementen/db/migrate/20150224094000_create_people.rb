class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.text :email
      t.text :name
      t.date :birthdate

      t.timestamps null: false
    end
  end
end
