class Tree < ActiveRecord::Base
  belongs_to :user_id
  validates :name, presence: true

end
