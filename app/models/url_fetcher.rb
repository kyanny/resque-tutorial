class UrlFetcher
  @queue = :fetch_title
  def self.perform(bookmark_id, url)
    html = Kernel.open(url).read
    title = (html.scan(/<title>(.*?)<\/title>/i).flatten)[1]
    bookmark = Bookmark.find(bookmark_id)
    bookmark.title = NKF.nkf('-m0 -w', title)
    bookmark.save
  end
end
