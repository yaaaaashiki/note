class Template < ActiveRecord::Base
  acts_as_paranoid
  include CurrentUser
  include JsonModel
end
