!SLIDE

# Real world examples

!SLIDE

## Finding a product verions latest publication

!SLIDE smaller

    @@@ruby
    class Publication < ActiveRecord::Base
      # ...

      scope :published, where("
        publications.status = ? AND
        publications.published_at <= utc_timestamp()
        AND (
          publications.expired_at IS NULL OR
          publications.expired_at > utc_timestamp()
        )", 'approved')

      scope :in_store, lambda { |store_id|
        where(:store_id => store_id)
      }

      scope :published_in_store, lambda { |store_id|
        in_store(store_id).published
      }

      # ...
    end

!SLIDE smaller

    @@@ruby
    class AddPublishedIndexToPublication < ActiveRecord::Migration
      def self.up
        add_index :publications, [
          :product_version_id,
          :store_id,
          :status,
          :published_at,
          :expired_at], :name => 'by_published'
      end

      def self.down
        remove_index :publications, :name => 'by_published'
      end
    end

[Source](https://github.com/partnerpedia/partnerpedia/blob/3308b17d2e3e4a3d3d855c8d69daeba313eb510a/db/migrate/20110704215429_add_published_index_to_publication.rb)
