class Wish < ActiveRecord::Base
  # belongs_to :category_id
  # belongs_to :user_id
  paginates_per 15
end
