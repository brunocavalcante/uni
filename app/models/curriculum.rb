class Curriculum < ActiveRecord::Base
  belongs_to :course
  has_many :curriculum_disciplines, :dependent => :destroy
  has_many :disciplines, :through => :curriculum_disciplines
  
  has_many :curriculum_students, :dependent => :restrict
  
  has_many :curriculum_modules, :dependent => :destroy
  
  validates :code, :presence => true
  validates :name, :presence => true
  
  scope :only_active, where('curriculums.active IS TRUE')
  scope :only_finished, where('curriculums.finished IS TRUE')
  scope :by_activeness, order('curriculums.active DESC, curriculums.created_at DESC')
  
  validates_uniqueness_of :code, :scope => :course_id
  
  validate :validate_active
  
  def validate_active
    errors.add(:active, :cant_inactivate_still_have_students) if !active && curriculum_students.only_active.count > 0
    errors.add(:active, :cant_activate_not_yet_finished) if active && !finished
  end
  
  validate :validate_finished
  
  def validate_finished
    errors.add(:finished, :cant_unfinish_has_students) if !finished && curriculum_students.count > 0
  end
end
