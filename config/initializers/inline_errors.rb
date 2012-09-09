# encoding: utf-8
## Provide the error message text to the field and replcae fieldWithErrors with a SPAN rather than
## a DIV tag.

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag.include?("<label" )
     html_tag.gsub(/^/, '<span class="field-with-errors">').gsub(/$/, '</span>').html_safe
  else
    if html_tag.include?('type="hidden"')
      html_tag
    else
      case I18n.locale
      when :jp
        error_message = []
        [instance.error_message].flatten.each do |msg|
          line = I18n.translate('errors.format', :default => "%{attribute} %{message}").gsub(/%\{attribute\}/, I18n.translate('errors.attribute_name', :default => "This")).gsub(/%\{message\}/, msg).strip
          error_message << "<span class=\"text\"><span>#{line}</span></span>"
        end
        html_tag.gsub(/^/, "<span class=\"field-with-errors\">#{error_message.join}").gsub(/$/, '</span>').html_safe
      else 
        error_message = I18n.translate('errors.format', :default => "%{attribute} %{message}").gsub(/%\{attribute\}/, I18n.translate('errors.attribute_name', :default => "This")).gsub(/%\{message\}/, [instance.error_message].flatten.to_sentence).strip
        html_tag.gsub(/^/, "<span class=\"field-with-errors\"><span class=\"text\"><span>#{error_message}</span></span>").gsub(/$/, '</span>').html_safe
      end
    end
  end     
  # r = %( <span class="field-with-errors">#{html_tag} )
  # r += %( <span class="text"><span>This #{[instance.error_message].flatten.to_sentence}</span></span>) unless html_tag.include?("<label" )
  # r + "</span>"
end
