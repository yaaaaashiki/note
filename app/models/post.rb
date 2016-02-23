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


  # tree = [
  # {
  #   name: ...,
  #   children: [
  #     name: ...,
  #     children: [
  #     ],
  #   ],
  #   post: ...,
  # },
  # {
  #   post: ...,
  # }
  # ]

  def self.insert tree_posts, paths, post
    # if else : treeのrootにpathsの先頭と同じものがあるか
    if tree_posts.select{|tree_post| tree_post.name == paths.first}.present?
      # tree = [{name: "a", children: [...]}, {name: "b", children: [...]}]
      # paths = ["b", "..", ...]

      # next_tree = {name: "b", children: [...]}
      next_tree = tree_posts.select{|tree_post| tree_post.name == paths.first}.first
      # next_tree[:children]
      # next_tree[:children], paths = ["..", ...], post
      insert next_tree.tree_posts, paths.drop(1), post
    else
      # treeの最直下にパスの先頭と同じディレクトリが無いとき
      # tree 最直下にパスの先頭を追加
      tree_posts << TreePost.new(name: paths.first)

      # pathsが複数あるとき => タイトルじゃ無いとき
      if paths.count > 1
        # ツリーにブロック追加 {name: paths.frst, children: []} , パスの先頭を取り除いく, post
        insert (tree_posts.select{|tree_post| tree_post.name == paths.first}.first.tree_posts), paths.drop(1), post
      else
        # paths が一つのみの場合 => タイトルの時
        tree_posts.select{|tree_post| tree_post.name == paths.first}.first.post = post
      end
    end
    tree_posts
  end

  def self.tree
    tree_posts = []
    all.each do |post|
      Post.insert tree_posts, post.path.split("/"), post
    end
    tree_posts

  end

end
