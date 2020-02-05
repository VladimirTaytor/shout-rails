class Search
  def self.for_hashtag(hashtag)
    Shout.joins("LEFT JOIN text_shouts ON content_type = 'TextShout' AND content_id = text_shouts.id")
        .where("text_shouts.body LIKE ?", "%##{hashtag}%")
  end
end
