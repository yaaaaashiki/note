module ApplicationHelper
  def html_pipeline(source)
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::AutolinkFilter
    ]
    pipeline.call(source)[:output]
  end

  # 選択中のサイドメニューのクラスを返す
  def sidebar_activete(class_name)
    is_active = false
    case class_name
    when :new_post
      is_active = true if controller_name == "posts" and action_name == "new"
    when :main
      is_active = true if controller_name == "main"
    when :posts
      is_active = true if controller_name == "posts" and action_name != "new"
    when :template
      is_active = true if controller_name == "templates"
    when :tag
      is_active = true if controller_name == "tags"
    when :logout
      is_active = true if controller_name == "login"
    end
    "#{class_name}#{' active' if is_active}"
  end


end
