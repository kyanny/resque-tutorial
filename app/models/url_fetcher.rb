class UrlFetcher
  @queue = :fetch_title
  def self.perform(bookmark_id, url)
    open(url){ |f|
      title = (f.scan(/<title>(.*?)<\/title>/).flatten)[1]
      bookmark = Bookmark.find(bookmark_id)
      bookmark.title = title
      bookmark.save
    }
  end
end
