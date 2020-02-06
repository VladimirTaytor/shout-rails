class Search
  def self.in_shouts_for(term)
    search_query = "%#{term}%"
    Shout
        .joins("LEFT JOIN text_shouts ON content_type = 'TextShout' AND content_id = text_shouts.id")
        .joins("LEFT JOIN photo_shouts ON content_type = 'PhotoShout' AND content_id = photo_shouts.id")
        .where("text_shouts.body LIKE ? OR photo_shouts.image_file_name LIKE ?", search_query, search_query)
  end
end
