class Event < ActiveRecord::Base
  belongs_to :person
  belongs_to :comment
end
