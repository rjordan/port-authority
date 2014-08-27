class Servlet < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :image, presence: true
end
