class LectureFile < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :person
  
  def title_or_name
    title != '' ? title : name
  end
  
  def mimetype
    extname = File.extname(name)[1..-1]
    mime_type = Mime::Type.lookup_by_extension(extname)
    content_type = mime_type.to_s unless mime_type.nil?
    
    return content_type
  end
end
