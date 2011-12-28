module Locked
  module ActsAsLocked
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def acts_as_locked(options = {})
        # your code will go here
      end
    end

    def lockable?
      true
    end

    def lock!
      self.locked = Date.today
    end

    def unlock!
      self.locked = nil
    end


  end
end

ActiveRecord::Base.send :include, Locked::ActsAsLocked
