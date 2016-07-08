module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg)}.join
    sentence = I18n.t('errors.messages.not_saved',
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-error alert-block">
      <h4>#{sentence}</h4>
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages_email!
    return '' if resource.errors.empty?
    resource.errors.full_messages.map { |msg| return msg if msg[0] == "E" }.join
  end

  def devise_error_messages_first_name!
    return '' if resource.errors.empty?
    resource.errors.full_messages.map { |msg| return msg if msg[0] == "F"}.join
  end

  def devise_error_messages_last_name!
    return '' if resource.errors.empty?
    resource.errors.full_messages.map { |msg| return msg if msg[0] == "L" }.join
  end

  def devise_error_messages_date!
    return '' if resource.errors.empty?
    resource.errors.full_messages.map { |msg| return msg if msg[0] == "D" }.join
  end

  def devise_error_messages_password!
    return '' if resource.errors.empty?
    resource.errors.full_messages.map { |msg| return msg if msg[0] == "P" }.join
  end
end