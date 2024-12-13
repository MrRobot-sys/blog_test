module Serializers
  class BaseResource < Blueprinter::Base

    identifier :id

    def self.resource_fields(except: ['id'], only: [], resource_klass: self.name.demodulize.constantize, exclude_ids: false)
      attrs = resource_klass.column_names
      attrs = attrs & only.map(&:to_s) if only.any?
      attrs = attrs - except.map(&:to_s) if except.any?
      attrs = attrs.filter { |attr| !attr.match?(/._id\z/) } if exclude_ids
      attrs = attrs.map(&:to_sym)
      fields *(attrs)
    end

  end
end