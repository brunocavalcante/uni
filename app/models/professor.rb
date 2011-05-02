class Professor < ActiveRecord::Base
  belongs_to :person
  belongs_to :scholarity

  accepts_nested_attributes_for :person
  def name
    person.name
  end
end
