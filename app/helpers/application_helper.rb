module ApplicationHelper
  def get_bread_crumb(url)
    begin
      breadcrumb = ''
      so_far = '/'
      elements = url.split('/')
      for i in 1...elements.size

        so_far += elements[i] + '/'

        if elements[i] =~ /^\d+$/
          begin
            breadcrumb += '<li>' + link_to_if(i != elements.size - 1, eval("#{elements[i - 1].singularize.camelize}.find(#{elements[i]}).name").gsub("_"," ").to_s, so_far) + '</li>'
          rescue
          breadcrumb += '<li>' + elements[i] + '</li>'
          end
        else
          breadcrumb += '<li>' + link_to_if(i != elements.size - 1, (I18n.t 'url.' + elements[i].gsub("-", "_").gsub(/\?.*/, '')), so_far) + '</li>'
        end

        breadcrumb += " <span class='divider'>/</span> " if i != elements.size - 1
      end
      breadcrumb
    rescue
      'Not available'
    end
  end
end