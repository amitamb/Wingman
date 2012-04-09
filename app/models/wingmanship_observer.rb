class WingmanshipObserver < ActiveRecord::Observer
  def after_create(wingmanship)
    Activity.add(wingmanship.person, Activity::WINGMAN_REQUEST_CREATED, wingmanship, [wingmanship.person, wingmanship.wingman])
  end
  
  def before_destroy(wingmanship)
    wingmanship.activities.destroy_all
  end
  
  def self.approved(wingmanship)
    Activity.add(wingmanship.wingman, Activity::WINGMAN_REQUEST_ACCEPTED, wingmanship, [wingmanship.person, wingmanship.wingman])
  end

end
