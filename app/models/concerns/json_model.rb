module JsonModel
  extend ActiveSupport::Concern

  def to_json(options = {})
    options[:methods] ||= []
    options[:methods] << :to_json_created_at
    options[:methods] << :to_json_updated_at
    puts options
    super options
  end

  def to_json_created_at
    I18n.l created_at
  end

  def to_json_updated_at
    I18n.l updated_at
  end
end
