module PostService
  include HTTParty
  base_uri 'http://localhost:4000'

  def self.all
    posts_json = get('/posts')
    posts_hash = JSON.parse(posts_json.body, symbolize_names: true)[:posts]
    posts_hash.map { |post| Post.new(post) }
  end

  def self.create(params)
    options = { body: params }
    post_json = post('/posts', options)
    post_hash = JSON.parse(post_json.body, symbolize_names: true)[:posts]
    Post.new(post_hash)
  end

  def self.find(id)
    post_json = get("/posts/#{id}")
    post_hash = JSON.parse(post_json.body, symbolize_names: true)
    Post.new(post_hash)
  end

  def self.find_comments(post_id)
    comments_json = get("/posts/#{post_id}/comments")
    comments_hash = JSON.parse(comments_json.body, symbolize_names: true)[:comments]
    comments_hash.map { |comment| Comment.new(comment) }
  end

  def self.create_comments(params)
    post_id = params[:post_id]
    options = { body: params.slice(:comment) }
    comment_json = post("/posts/#{post_id}/comments", options)
    comment_hash = JSON.parse(comment_json.body, symbolize_names: true)
    Comment.new(comment_hash)
  end
end
