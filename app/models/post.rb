class Post < ActiveRecord::Base
  acts_as_paranoid
  include CurrentUser

end
