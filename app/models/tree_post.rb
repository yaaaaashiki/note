class TreePost
  include ActiveModel::Model
  attr_accessor :tree_posts, :name, :post, :dipth, :parent

  def self.all
    Post.tree
  end

  def initialize(attributes = {})
    super
    @dipth ||= 0
    @tree_posts ||= []
  end

  def insert_post(paths, post)
    current_path = paths.shift
    if (next_tree = find_in_children(current_path).presence)
      next_tree.insert_post paths, post
    else
      append(name: current_path).insert_path_or_post(paths, post)
    end
  end

  def posts_count_zero?
    sum = posts_count
    sum.zero? ? '' : sum
  end

  def posts_count
    sum = 0
    tree_posts.each do |tree_post|
      sum += 1 if tree_post.post.present?
      sum += tree_post.posts_count
    end
    sum
  end

  def insert_path_or_post(paths, post)
    # パスがまだあるか
    if paths.present?
      insert_post paths, post
    else
      @post = post
    end
  end

  def full_path
    parent.present? ? "#{name}/#{parent.full_path}" : ""
  end

  private

  def <<(attributes = {})
    attributes[:dipth] ||= @dipth + 1
    tree_post = TreePost.new(attributes)
    tree_posts << tree_post
    tree_post.parent = self
    tree_post
  end

  alias append <<

  def find_in_children(name)
    @tree_posts.find { |tree_post| tree_post.name == name }
  end
end
