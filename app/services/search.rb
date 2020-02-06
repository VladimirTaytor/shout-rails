class Search
  def self.in_shouts_for(term)
    Shout.joins("LEFT JOIN text_shouts ON content_type = 'TextShout' AND content_id = text_shouts.id")
        .where("text_shouts.body LIKE ?", "%#{term}%")
  end
end
