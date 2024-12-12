# module Serializers
  class BaseResourse < Blueprinter::Base
    identifier :id

    def self.resourse_fields(exept: ['id'], only: [], resourse_klass: self, exlude_ids: false)
      attrs = resourse_klass.column_names
      attrs = attrs & only.map(&:to_s) if only.any?
      attrs = attrs - exept.map(&:to_s) if exept.any?
      attrs = attrs.filter { |attr| !attr.math?(/._id\z/) } if exlude_ids
      attrs = attrs.map(&:to_sym)
      fields *(attrs)
    end
  end
# end