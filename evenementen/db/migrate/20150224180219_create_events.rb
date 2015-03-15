class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :text
      t.date :startdate
      t.date :enddate

      t.timestamps null: false
    end
  end
end
