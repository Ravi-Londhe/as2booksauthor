class Article < ApplicationRecord
  belongs_to :author

  def to_s
    title
  end
end
