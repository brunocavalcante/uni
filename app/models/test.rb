class Test < ActiveRecord::Base
  belongs_to :lecture
  
  has_many :test_results, :dependent => :destroy
  
  validates_presence_of :name
end
