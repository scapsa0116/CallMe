class Job < ApplicationRecord
    has_many :reviews
    belongs_to :user
    has_many :users, through: :reviews
    belongs_to :category



   scope :alpha, -> { order(:title) }
   scope :most_reviews, -> {left_joins(:reviews).group('jobs.id').order('count(reviews.job_id) desc')}
end
