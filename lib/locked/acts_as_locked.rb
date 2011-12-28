module Locked
  module ActsAsLocked
    extend ActiveSupport::Concern

    included do

    end

    module ClassMethods
      def acts_as_locked(options = {})
        cattr_accessor :fields
        self.fields = options.delete(:fields)

        validate :changes_on_lock
      end
    end

    def lockable?
      flag = true
      self.fields.each do |field|
        flag = false unless self.send(field.to_sym) if flag
      end
      flag
    end

    def lock!
      self.locked_at = Time.now if lockable?
    end

    def unlock!
      self.locked_at = nil
    end

    def locked?
      self.locked_at != nil
    end

    private
    def changes_on_lock
      if locked_at
        self.fields.each do |field|
          errors.add(field.to_sym, "Este campo no puede ser modificado") if self.send("#{field}_changed?")
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, Locked::ActsAsLocked
