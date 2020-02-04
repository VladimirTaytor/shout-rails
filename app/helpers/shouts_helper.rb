# frozen_string_literal: true

module ShoutsHelper
  def like_button(shout)
    return link_to "Unlike",
                   unlike_shout_path(shout),
                   method: :delete if current_user.liked?(shout)

    link_to "Like", like_shout_path(shout), method: :post
  end

  def autolink(text)
    text.gsub(/@\w+/) { |mention| link_to mention, user_path(mention[1..-1])}.html_safe
  end
end
