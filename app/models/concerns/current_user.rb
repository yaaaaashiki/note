module CurrentUser
  extend ActiveSupport::Concern

  included do
    belongs_to :created_user, class_name: :User
    belongs_to :updated_user, class_name: :User

    before_create :set_current_user
    before_create :set_updated_user

    before_update :set_updated_user
  end

  def current_user_id
    User.current_user
  end

  def set_current_user
    self.created_user_id = current_user_id if current_user_id.present?
    true
  end

  def set_updated_user
    self.updated_user_id = current_user_id if current_user_id.present?
    true
  end
end
