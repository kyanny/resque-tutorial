# Resque Tutorial

```
rails s
VVERBOSE=1 QUEUE=* rake environment resque:work
open http://localhost:3000/bookmarks
```

## 説明

 * シンプルなブックマークアプリ
 * タイトルの取得をジョブキューで非同期処理する (app/models/url_fetcher.rb)
 * ブックマーク登録時にはダミーのタイトルを保存して、ジョブワーカー (Resque) で取得したタイトルで更新する
