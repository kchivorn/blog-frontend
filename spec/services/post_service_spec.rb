require 'rails_helper'

RSpec.describe PostService do
  describe '#create posts' do
    let(:post_response) do
      {
        posts: {
          id: 1,
          title: 'Hello',
          body: 'What a wonderful day!'
        }
      }
    end
    let(:params) do
      { post: { title: 'Hello', body: 'What a wonderful day!' } }
    end
    before do
      stub_request(:post, 'http://localhost:4000/posts')
        .with(body: params)
        .to_return(status: 200, body: post_response.to_json, headers: { content_type: 'application/json' })
    end
    it 'create a new post to the server' do
      post = PostService.create(params)
      expect(post.title).to eq('Hello')
      expect(post.body).to eq('What a wonderful day!')
    end
  end

  describe '#all posts' do
    let(:post_response) do
      {
        posts: [{
          id: 1,
          title: 'Hello',
          body: 'What a wonderful day!'
        }]
      }
    end
    before do
      stub_request(:get, 'http://localhost:4000/posts')
        .to_return(status: 200, body: post_response.to_json, headers: { content_type: 'application/json' })
    end
    it 'retrieve all posts from the server' do
      posts = PostService.all
      expect(posts.length).to equal(1)
      expect(posts.first.title).to eq('Hello')
      expect(posts.first.body).to eq('What a wonderful day!')
    end
  end

  describe '#find post by id' do
    let(:post_response) do
      {
        id: 1,
        title: 'Hello',
        body: 'What a wonderful day!'
      }
    end
    before do
      stub_request(:get, 'http://localhost:4000/posts/1')
        .to_return(status: 200, body: post_response.to_json, headers: { content_type: 'application/json' })
    end
    it 'retrieve post by id from the server' do
      post = PostService.find(1)
      expect(post.title).to eq('Hello')
      expect(post.body).to eq('What a wonderful day!')
    end
  end

  describe '#find_comments' do
    let(:comments_response) do
      [{
        id: 1,
        name: 'John',
        body: 'Great!',
        post_id: 1,
        created_at: '2021-02-18 18:31:00 +0700'
      }]
    end
    before do
      stub_request(:get, 'http://localhost:4000/posts/1/comments')
        .to_return(status: 200, body: comments_response.to_json, headers: { content_type: 'application/json' })
    end
    it 'retrieve all comments of a post by post_id from the server' do
      comments = PostService.find_comments(1)
      expect(comments.length).to eq(1)
      expect(comments.first.name).to eq('John')
      expect(comments.first.body).to eq('Great!')
      expect(comments.first.post_id).to eq(1)
    end
  end

  describe '#create_comments' do
    let(:comment_response) do
      {
        'id' => 1,
        'name' => 'John',
        'body' => 'Great!',
        'post_id' => 1,
        'created_at' => '2021-02-18 18:31:00 +0700'
      }
    end
    let(:params) { { post_id: 1, comment: { name: 'Hello', body: 'What a wonderful day!' } } }
    before do
      stub_request(:post, 'http://localhost:4000/posts/1/comments')
        .with(body: params.slice(:comment))
        .to_return(status: 200, body: comment_response.to_json, headers: { content_type: 'application/json' })
    end
    it 'retrieve all comments of a post by post_id from the server' do
      comment = PostService.create_comments(params)
      expect(comment.name).to eq('John')
      expect(comment.body).to eq('Great!')
      expect(comment.post_id).to eq(1)
    end
  end
end
