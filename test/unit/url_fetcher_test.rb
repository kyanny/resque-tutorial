# -*- coding: utf-8 -*-
require 'test_helper'

class UrlFetcherTest < ActiveSupport::TestCase
  setup do
    @bookmark = Bookmark.create
  end

  test 'perform' do
    io = stub('io', read: '<html><head><title>ライブドア</title></head><body>ライブドアのページだよー</body></html>')
    Kernel.stubs(:open).returns(io)
    UrlFetcher.perform(@bookmark.id, 'http://www.livedoor.com/')
    @bookmark.reload
    assert_equal 'ライブドア', @bookmark.title
  end
end
