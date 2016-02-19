class Template < ActiveRecord::Base
  acts_as_paranoid
  include CurrentUser
  include JsonModel


  def path_set_date
    Date.today.strftime path
  end

end
