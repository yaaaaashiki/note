class TreePostsController < ApplicationController
  def index
    tree_posts = Post.tree
    render json: tree_posts
    # render json: @posts.to_json(include: [
    #   {created_user: {except: :password_digest}},
    #   {updated_user: {except: :password_digest}}
    # ])
  end

  private

  def insert tree, paths, post
    if tree.select{|block| block[:name] == paths.first}.present?
      next_tree = tree.select{|block| block[:name] == paths.first}.first
      next_tree[:children] = [] unless next_tree[:children]
      insert next_tree[:children], paths.drop(1), post
    else
      tree << {name: paths.first}
      if paths.count > 1
        insert (tree.select{|block| block[:name] == paths.first}.first[:children] = []), paths.drop(1), post
      else
        tree.select{|block| block[:name]}.first[:post] = post
      end
    end
    tree
  end

end
