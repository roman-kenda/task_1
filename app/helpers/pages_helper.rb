module PagesHelper
  def name_link_twitter
    user_signed_in? ? "Connect Twitter Account" : "Authorize throw Twitter Account"
  end
end
