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


end
