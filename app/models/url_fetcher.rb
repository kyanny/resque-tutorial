class UrlFetcher
  @queue = :fetch_title
  def self.perform(bookmark_id, url)
    open(url){ |f|
      title = (f.scan(/<title>(.*?)<\/title>/i).flatten)[1]
      bookmark = Bookmark.find(bookmark_id)
      bookmark.title = NKF.nkf('-m0 -w', title)
      bookmark.save
    }
  end
end
