class Servlet < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :image, presence: true
  serialize :ports, JSON 
  serialize :volumes, JSON
end
