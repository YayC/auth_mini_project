class Token < ActiveRecord::Base
  belongs_to :user
  # Remember to create a migration!
end
