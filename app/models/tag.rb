class Tag < ActiveRecord::Base
  acts_as_paranoid
  include CurrentUser
  include JsonModel

  has_many :post_tags
  has_many :posts, through: :post_tags
end
