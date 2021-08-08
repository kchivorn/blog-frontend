class Comment
  attr_reader :id,
              :name,
              :body,
              :post_id,
              :created_at

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @body = data[:body]
    @post_id = data[:post_id]
    @created_at = data[:created_at]
  end
end
