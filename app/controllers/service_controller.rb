class ServiceController < ApplicationController
  def index

  end
  def posts
    render layout: nil
  end

  def post_new
    render layout: nil, template: "service/posts/new"
  end

  def post_show
    render layout: nil, template: "service/posts/show"
  end

  def post_view
    render layout: nil, template: "service/posts/post_view"
  end

  def main
    render layout: nil
  end

  def tree
    render layout: nil
  end
end
