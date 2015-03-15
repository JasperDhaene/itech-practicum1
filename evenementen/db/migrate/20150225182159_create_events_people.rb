class CreateEventsPeople < ActiveRecord::Migration
  def change
    create_table :events_people, id: false do |t|
      t.belongs_to :event, index: true
      t.belongs_to :person, index: true
    end
    add_index :events_people, [:event_id, :person_id], :unique => true
  end
end
