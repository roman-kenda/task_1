module PicturesHelper

  def human_size(size)
    (size/100000).round(2)
  end

  def  extension(image_url)
    only_url(image_url)[0].reverse
  end

  def name(image_url)
    only_url(image_url)[1].split('/')[0].reverse
  end

  private

  def only_url(image_url)
  	url = image_url.reverse
    url.split('.', 2)
  end

end
