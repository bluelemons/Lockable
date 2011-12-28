module Locked
  module ActsAsLocked
    extend ActiveSupport::Concern

    included do

    end

    module ClassMethods
      def acts_as_locked(options = {})
        cattr_accessor :fields
        self.fields = options.delete(:fields)
      end
    end

    def lockable?
      flag = true
      self.fields.each do |field|
        flag = false unless self.send(field.to_sym)
      end
      flag
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
