class Template < ActiveRecord::Base
  acts_as_paranoid
  include CurrentUser
  include JsonModel


  def path_set_date
    Date.today.strftime(path).gsub(/\$(\w)/) do |w|
      case w
      when "$u"
        User.find(User.current_user).name
      end
    end
  end

end
