module Serializers
  class Article < BaseResource
    INDEX_FIELDS = %i[name]
    EXEPT_FIELDS = %i[created_at updated_at]

    resource_fields(only: [:name])
  end
end
