class Wingmanship < ActiveRecord::Base
  belongs_to :person
  belongs_to :wingman, :class_name => "Person"

  def approved?
    self.wingman_approved == true
  end

  def approve!
    self.wingman_approved = true
    WingmanshipObserver.approved(self)
    self.save!
  end

  has_many :activities, :as => :target

end
