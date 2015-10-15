web: redis-server /usr/local/etc/redis.conf
web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
worker: bundle exec sidekiq