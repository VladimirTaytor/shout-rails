# frozen_string_literal: true

module ShoutsHelper
  def avatar(user)
    email_digest = Digest::MD5.hexdigest user.email
    gravatar_url = "//www.gravatar.com/avatar/#{email_digest}"

    image_tag gravatar_url
  end
end
