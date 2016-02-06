class Post < ActiveRecord::Base
  acts_as_paranoid
  include AASM
  include CurrentUser
  include JsonModel

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


  def self.insert tree, paths, post
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
