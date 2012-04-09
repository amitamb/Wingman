class ItemObserver < ActiveRecord::Observer
  def after_create(item)
    Activity.add(item.sharer, Activity::ITEM_SHARED, item, item.listeners.all.concat( [item.sharer] ) )
  end

  def before_destroy(item)
    item.activities.destroy_all
  end

  def after_save(item)
    #Activity.add(wingmanship.person, Activity::WINGMAN_REQUEST_CANCELED, wingmanship, [], wingmanship.wingman)
  end

end
