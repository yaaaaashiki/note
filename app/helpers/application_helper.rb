module ApplicationHelper
  def html_pipeline(source)
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::AutolinkFilter
    ]
    pipeline.call(source)[:output]
  end
end
