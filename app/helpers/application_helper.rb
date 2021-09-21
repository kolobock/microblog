module ApplicationHelper
  ## Output flash messages
  def render_flash_messages
    flash.collect do |key, msg|
      content_tag :span, id: 'flasher', class: "flash #{key}" do
        content_tag(:span, class: "#{key} icon") do
          msg.html_safe
        end +
            content_tag(:a, class: "close_flash icon") do
            end
      end
    end.join.html_safe unless flash.blank?
  end
end
