module ActivitiesHelper
  def sentence_person_link(person, capitalize = false)
    if current_person.id == person.id
      capitalize ? "You"  : "you"
    else
      link_to person.name, person
    end
  end
  
  # sentence_person_link(activity.person) %> <%= sentence_middle(person) %> <%=  
  def activity_sentence(activity)
    
    start = sentence_person_link(activity.person, true)

    middle = case activity.activity_type
       when Activity::WINGMAN_REQUEST_CREATED then " sent wingmanship request to "
       when Activity::WINGMAN_REQUEST_ACCEPTED then " accepted wingmanship request from "
       #when Activity::WINGMAN_REQUEST_CANCELED then " canceled wingmanship request to "
       #when Activity::WINGMAN_REQUEST_REJECTED then " rejected wingmanship request from "
       when Activity::ITEM_SHARED then " shared item with "
       #when Activity::ITEM_DELETED then " deleted an item "
       when Activity::COMMENT_CREATED then " commented on "
       else "Unknown"
    end

    last = case activity.activity_type
       when Activity::WINGMAN_REQUEST_CREATED then sentence_person_link(activity.target.wingman)
       when Activity::WINGMAN_REQUEST_ACCEPTED then sentence_person_link(activity.target.person)
       #when Activity::WINGMAN_REQUEST_CANCELED then sentence_person_link(activity.secondary)
       #when Activity::WINGMAN_REQUEST_REJECTED then sentence_person_link(activity.target.person)
       when Activity::ITEM_SHARED then activity.target.listeners.length == 1 ? sentence_person_link(activity.target.listeners.first) : pluralize(activity.target.listeners.length, "person")
       #when Activity::ITEM_DELETED then " deleted the item "
       when Activity::COMMENT_CREATED then " commented on "
       else "Unknown"
    end
    
    
  
    sent = start + middle + last + "."
    
    sent.html_safe
  end
end
