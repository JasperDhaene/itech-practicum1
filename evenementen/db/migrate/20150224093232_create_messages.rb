class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :person, index: true
      t.text :text
      t.date :date
      t.references :event, index: true

      t.timestamps null: false
    end
    add_foreign_key :messages, :people
    add_foreign_key :messages, :events
  end
end
