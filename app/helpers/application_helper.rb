module ApplicationHelper

  def rails_route
    "#{controller_name}-#{action_name}"
  end

  def flash_messages
    flash.each do |type, msg|
      concat(content_tag(:div, msg, class: "alert #{bs_class_for(type)}"))
    end
    nil
  end

  def phone_link(phone)
    link_to phone, "tel:#{phone.gsub(/[^\d]/, '')}"
  end

  def email_link(email)
    link_to t('.email'), "mailto:#{email}"
  end

  def address_link(address)
    link_to address, "https://maps.google.com?q=#{address}", target: '_blank'
  end

  private

  def bs_class_for(type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning'
    }[type.to_sym] || 'alert-info'
  end

end
