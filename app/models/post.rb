class Post < ActiveRecord::Base
  belongs_to :user

  scope :published, where(:published => true)
  scope :latest, order('created_at DESC')
end
