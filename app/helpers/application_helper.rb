module ApplicationHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    if  user.avatar.attached?
      gravatar_url = image_path(url_for(user.avatar))
    end
    image_tag(gravatar_url, alt: user.username, class: "img-circle",height:80,width:80)
  end
end
