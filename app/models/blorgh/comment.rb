module Blorgh
  class Comment < ApplicationRecord
    validates :text, presence: true
  end
end
