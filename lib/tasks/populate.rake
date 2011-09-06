namespace :db do

  desc "Populate database"
  task :populate => :environment do
    [User, Post].each(&:delete_all)

    User.populate(1000) do |user|
      user.name = Faker::Internet.user_name
      Post.populate(50..150) do |post|
        post.title = Populator.words(1..5).titleize
        post.body = Populator.paragraphs(1..3)
        post.user_id = user.id
        post.published = [true, false]
        post.created_at = Time.random
      end
    end

  end

end
