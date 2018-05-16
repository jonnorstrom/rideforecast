class Trip < ApplicationRecord
  validates_presence_of: start_place
end
