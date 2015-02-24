class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :text
      t.date :startdate
      t.date :enddate
      t.references :person, index: true
      t.references :message, index: true

      t.timestamps null: false
    end
    add_foreign_key :events, :people
    add_foreign_key :events, :messages
  end
end
