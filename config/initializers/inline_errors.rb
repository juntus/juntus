ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html = %(<div class="field_with_errors">#{html_tag}</div>).html_safe
  # add nokogiri gem to Gemfile
  
  form_fields = %w(textarea input select)

  elements = Nokogiri::HTML::DocumentFragment.parse(html_tag).css "label, " + form_fields.join(', ')
  
  elements.each do |e|
    if e.node_name.eql? 'label'
      html = %(<div class="control-group f_error">#{e}</div>).html_safe
    elsif form_fields.include? e.node_name
      if instance.error_message.kind_of?(Array)
        html = %(<div class="control-group f_error">#{html_tag}<label class="error" for="#{e.node_name}">#{instance.error_message.join(',')}</label></div>).html_safe
      else
        html = %(<div class="control-group f_error">#{html_tag}<label class="error" for="#{e.node_name}">#{instance.error_message}</label></div>).html_safe
      end
    end
  end
  html
end