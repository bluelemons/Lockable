class Person < ActiveRecord::Base
  acts_as_locked(:name)
end
