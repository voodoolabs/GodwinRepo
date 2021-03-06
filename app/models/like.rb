class Like < ActiveRecord::Base
	belongs_to :user
	belongs_to :post,  counter_cache: true
	belongs_to :comment

	validates_uniqueness_of :user_id, scope: :post_id
end
