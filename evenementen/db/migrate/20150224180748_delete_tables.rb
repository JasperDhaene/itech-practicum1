class DeleteTables < ActiveRecord::Migration
  def change
    drop_table :events

  end
end
 # in case some dipshit fucks up again, run "bin/rake db:migrate:up VERSION=20150224180748" to delete the events tables and run "bin/rake db:migrate" to generate the new (modified) tables.
 # Note: 20150224180748 is the timestamp when this file was created. This may or may not differ on other computers depending on the amount of fiddling with the code.
