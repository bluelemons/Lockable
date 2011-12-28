class Person < ActiveRecord::Base
  acts_as_locked(:fields=> [:name])
end
