class Site < ActiveRecord::Base
  belongs_to :person
  
  def full_url
    full_url = url
    if !(url =~ /http:\/\/.*/)
      full_url = "http://#{url}"
    end
    
    return full_url
  end
end
