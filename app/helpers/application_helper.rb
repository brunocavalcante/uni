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
            breadcrumb += link_to_if(i != elements.size - 1, eval("#{elements[i - 1].singularize.camelize}.find(#{elements[i]}).name").gsub("_"," ").to_s, so_far)
          rescue
          breadcrumb += elements[i]
          end
        else
          breadcrumb += link_to_if(i != elements.size - 1, (I18n.t 'url.' + elements[i].gsub("-", "_")), so_far)
        end

        breadcrumb += " &raquo; " if i != elements.size - 1
      end
      breadcrumb
    rescue
      'Not available'
    end
  end

  #include WillPaginate::ViewHelpers

  #def will_paginate_with_i18n(collection, options = {})
  #  will_paginate_without_i18n(collection, options.merge(:previous_label => I18n.t(:previous), :next_label => I18n.t(:next)))
  #end

  #alias_method_chain :will_paginate, :i18n*/
end