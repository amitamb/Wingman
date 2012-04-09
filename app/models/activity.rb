class Activity < ActiveRecord::Base
  belongs_to :person
  belongs_to :secondary, :foreign_key => :secondary_id, :class_name => "Person"
  belongs_to :target, :polymorphic => true

  has_and_belongs_to_many :listeners, :class_name => "Person" # :foreign_key => person

  default_scope lambda { joins("INNER JOIN activities_people ON activities_people.activity_id = activities.id").where("activities_people.person_id = ?", Person.current).order('activities.created_at DESC').limit(10) }

  # User sent wingmanship request to wingmanship.wingman  
  WINGMAN_REQUEST_CREATED = 1 #target —> model wingmanship
  # User accepted wingmanship request to wingmanship.person
  WINGMAN_REQUEST_ACCEPTED = 2 #target —> model wingmanship 
  # User canceled wingmanship request to wingmanship.wingman
  # WINGMAN_REQUEST_CANCELED = 3 #target —> model wingmanship
  # User rejected wingmanship request from wingmanship.person
  # WINGMAN_REQUEST_REJECTED = 4 #target —> model wingmanship

  # User shared item with [list of people] i.e. item.listeners
  ITEM_SHARED = 11 #target —> model item
  # User shared item with [list of people] i.e. item.listeners
  # ITEM_DELETED = 12 #target —> model item
  
  # User commented on comment.commentable
  COMMENT_CREATED = 21 #target —> model comment
  # User commented on comment.commentable
  # not needed
  # COMMENT_DELETED = 22 #target —> model comment
  
  class << self
    def add(person, activity_type, target, listeners = [], secondary = nil )
      return false if person.blank? or activity_type.blank? or target.blank?
      activity = Activity.create(:person => person, :activity_type => activity_type, :target => target) #, :secondary => secondary )
      activity.listeners << listeners
    end
  end
  
end
