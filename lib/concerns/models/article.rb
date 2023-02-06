module Blorgh::Concerns::Models::Article
  extend ActiveSupport::Concern

  # `included do` causes the block to be evaluated in the context
  # in which the module is included (i.e. Blorgh::Article),
  # rather than in the module itself.

  included do
    attr_accessor :author_name
    belongs_to :author, class_name: Blorgh.author_class.to_s

    before_validation :set_author

    private

      def set_author
        self.author = Blorgh.author_class.find_or_create_by(name: author_name)
      end
  end

  def summary
    "#{title}"
  end

  module ClassMethods
    def some_class_method
      'some class method string'
    end
  end
end
