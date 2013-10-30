module MessagesHelper
  def get_message_label(code,message)
    if code == 200
       klass = "label label-info"
    else
      klass =  "label label-important"
    end
    content_tag :span ,message,class: klass
  end
end
