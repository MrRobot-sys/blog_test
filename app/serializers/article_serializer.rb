# module Serializers

  class ArticleSerializer < BaseResourse
    INDEX_FIELDS = %i[name]
    EXEPT_FIELDS = %i[created_at updated_at]

    resourse_fields(only: [:name], resourse_klass: Article)
  end
# end
