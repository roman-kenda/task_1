module PicturesHelper

  def type_message(string)
    if 'Picture was successfully destroyed.' == string
      'alert alert-danger'
    else
      'alert alert-success'
    end
  end
end