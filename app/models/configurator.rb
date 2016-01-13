class Configurator < ActiveRecord::Base
  before_create :set_key
  before_validation :set_slug
  before_save :strip_name
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
  has_many :formelements
  
  private
   
  def set_key
    self.key = Array.new(20){rand(36).to_s(36)}.join 
  end
  
  def set_slug
    return unless self.name.present?
    self.slug = begin
      0.upto(1_000_000) do |n|
        value = (n == 0 ? self.name.parameterize : (self.name.parameterize + "-" + n.to_s) )
        break value unless self.class.where(slug: value).exists?
      end
    end
  end
  
  def strip_name
    self.name = self.name.strip
  end
  
end
