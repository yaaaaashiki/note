class Post < ActiveRecord::Base
  acts_as_paranoid
  include AASM
  include CurrentUser
  include JsonModel

  has_many :post_tags
  has_many :tags, through: :post_tags

  aasm do
    state :new, initial: true
    state :wip
    state :saved
    state :editing

    event :wip_save do
      transitions from: :new, to: :wip
    end
  end

  before_create :wip_save

  paginates_per 10

  def self.tree
    root_tree = TreePost.new
    all.each do |post|
      root_tree.insert_post post.path.split('/'), post
    end
    root_tree
  end
end
