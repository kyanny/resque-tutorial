class UrlFetcher
  @queue = :url_fetcher
  def self.perform(bookmark_id, url)
    html = Kernel.open(url).read
    title = (html.scan(/<title>(.*?)<\/title>/i).flatten).first
    bookmark = Bookmark.find(bookmark_id)
    bookmark.title = NKF.nkf('-m0 -w', title)
    bookmark.save
  end
end
