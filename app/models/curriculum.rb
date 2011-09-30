class Curriculum < ActiveRecord::Base
  belongs_to :course
  has_many :curriculum_disciplines, :dependent => :destroy
  has_many :disciplines, :through => :curriculum_disciplines
  
  validates :code, :presence => true
  validates :name, :presence => true
end
