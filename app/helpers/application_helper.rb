module ApplicationHelper
  def auth_token_input
    "<input type='hidden' name = 'authenticity_token' value='#{form_authenticity_token }'>".html_safe
  end

  def long_line
    "<p>________________________________</p>".html_safe
  end
end
