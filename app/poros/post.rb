class Post
  attr_reader :id,
              :title,
              :body,
              :created_at,
              :comments_path

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @body = data[:body]
    @created_at = data[:created_at]
    @comments_path = data[:comments_path]
  end
end
