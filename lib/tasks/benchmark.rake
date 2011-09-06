require 'benchmark'

def explain_headers
  %w(id select_type table type possible_keys key key_len ref filtered rows Extra)
end

def benchmark_query(name, query)
  ActiveRecord::Base.connection.clear_query_cache
  ActiveRecord::Base.connection.execute("RESET QUERY CACHE")

  puts name.color(:blue).bright
  puts query.to_sql.color(:green)

  puts ActiveRecord::Base.connection.execute("EXPLAIN EXTENDED #{query.to_sql}").to_a
    .unshift(explain_headers)
    .to_table(:first_row_is_head => true)

  Benchmark.bm do |x|
    x.report{ query.all }
  end

  puts "\n"
end

task :benchmark => :environment do
  benchmark_query "5 latest posts", Post.latest.limit(5)
  benchmark_query "5 latest published posts", Post.published.latest.limit(5)

  user = User.find(rand(1000) + 1)
  benchmark_query "Posts for a user", user.posts
  benchmark_query "Published posts for a user", user.posts.published
  benchmark_query "5 latest published posts for a user", user.posts.published.latest.limit(5)
end
