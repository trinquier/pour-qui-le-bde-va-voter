class Log < ActiveRecord::Base

  belongs_to :admin
  belongs_to :item

  default_scope order('created_at DESC')

  validates :content, presence: true
  validates :admin, presence: true

end
