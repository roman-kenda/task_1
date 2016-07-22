module ApplicationHelper
  def type_message(string)
    if /(destroyed.|disconnected.|wasn't connected.)+/ =~ string
      'alert alert-danger'
    else
      'alert alert-success'
    end
  end
end