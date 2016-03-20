class Giving < ActiveRecord::Base
  belongs_to :user
  belongs_to :wish
end
