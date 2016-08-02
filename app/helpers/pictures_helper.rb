module PicturesHelper
  
  def name(picture)
    token_url(picture)[1].split('/')[0].reverse.titleize
  end

  def extension(picture)
    token_url(picture)[0].reverse
  end

  private

  def token_url(url)
    url.reverse.split('.', 2)
  end
end