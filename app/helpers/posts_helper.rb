module PostsHelper
  TRUNCATE_LENGTH = 250

  def format_date(date)
    date.strftime('%Y-%m-%d %H:%M')
  end

  def truncate_post(post)
    post.truncate(TRUNCATE_LENGTH)
  end
end
