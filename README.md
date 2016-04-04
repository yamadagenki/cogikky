# cogikky

# 開発環境のアップデート

```
git branch -D tmp
git co -b tmp
git fetch
git co master
rm db/development.sqlite3
rm db/schema.rb
bundle exec rake db:setup
```
