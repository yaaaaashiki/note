class TreePost
  include ActiveModel::Model
  attr_accessor :tree_posts, :name, :post

  def initialize(attributes={})
    super
    @tree_posts ||= []
  end


  def posts_count_zero?
    sum = posts_count
    sum.zero? ? "" : sum
  end

  def posts_count
    sum = 0
    tree_posts.each do |tree_post|
      sum += 1 if tree_post.post.present?
      sum += tree_post.posts_count
    end
    sum
  end


  def self.all
    Post.tree
  end

end

