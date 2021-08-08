class Post
  attr_reader :title,
              :body,
              :created_at

  def initialize(data)
    @title = data[:title]
    @body = data[:body]
    @created_at = data[:created_at]
  end
end
