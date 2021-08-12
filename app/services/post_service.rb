module PostService
  include HTTParty
  base_uri ENV.fetch('BLOG_SERVER_URL')

  def self.all
    posts_json = get('/posts')
    posts_hash = JSON.parse(posts_json.body, symbolize_names: true)[:posts]
    posts_hash.map { |post| Post.new(post) }
  end

  def self.create(params)
    options = { body: params }
    post_json = post('/posts', options)
    post_hash = JSON.parse(post_json.body, symbolize_names: true)[:post]
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
    comments_hash.sort_by! do |c|
      c[:created_at]
    end.reverse! # A good api would provide a way to retrieve records by a field in descending order without sorting here
    comments_hash.map { |comment| Comment.new(comment) } || []
  end

  def self.create_comment(params)
    post_id = params[:comment][:post_id]
    options = { body: params }
    comment_json = post("/posts/#{post_id}/comments", options)
    comment_hash = JSON.parse(comment_json.body, symbolize_names: true)[:comment]
    Comment.new(comment_hash)
  end
end
