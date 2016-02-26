class Formelement < ActiveRecord::Base
  belongs_to :configurator
  
  validates :name, presence: true
  validates :type, presence: true
  
  def tag_type
    'n/a'
  end
end