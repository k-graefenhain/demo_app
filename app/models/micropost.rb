class Micropost < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user

  default_scope :order => 'microposts.created_at DESC'

  validates :user_id, :presence => true
  validates :content, :presence => true, :length => { :maximum => 140 }
  # use presence validator, see http://guides.rubyonrails.org/active_record_validations_callbacks.html
  #, :allow_blank => false
end
