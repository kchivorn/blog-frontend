module PostService
  include HTTParty
  base_uri 'http://localhost:4000'

  def self.all
    get('/posts')
  end

  def self.create(params)
    options = { body: params }
    post('/posts', options)
  end

  def self.find(id)
    get("/posts/#{id}")
  end

  def self.find_comments(post_id)
    get("/posts/#{post_id}/comments")
  end

  def self.create_comments(params)
    post_id = params[:post_id]
    options = { body: params.slice(:comment) }
    post("/posts/#{post_id}/comments", options)
  end
end
