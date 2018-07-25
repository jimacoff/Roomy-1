module ApplicationHelper
    def avatar_for(user)
        # if user.image
        #     #if user has image via Facebook
        #     "http://graph.facebook.com/#{user.uid}/picture?type=large"
        # else
            gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
            gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=180"
            # image_tag(gravatar_url, class: "gravatar avatar_small")
        # end
      end
end
