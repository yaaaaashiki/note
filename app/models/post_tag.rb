class PostTag < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :post
  belongs_to :tag
end
