class Message < ActiveRecord::Base
  belongs_to :person
  belongs_to :event
end
