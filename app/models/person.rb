class Person < ActiveRecord::Base

  def self.current
    Thread.current[:user].person
  end

  def self.current=(person)
    Thread.current[:user] = person.user
  end

  acts_as_taggable_on :knows, :needs

  belongs_to :user

  delegate :name, :to => :user
  delegate :image, :to => :user
  delegate :image_large, :to => :user

  has_many :all_wingmanships, :class_name => "Wingmanship", :foreign_key => "person_id"
  has_many :all_wingmans, :through => :all_wingmanships, :source => :wingman
  has_many :all_inverse_wingmanships, :class_name => "Wingmanship", :foreign_key => "wingman_id"
  has_many :all_inverse_wingmans, :through => :all_inverse_wingmanships, :source => :person, :source => :person

  has_many :wingmanships, :conditions => { :wingman_approved => true }
  has_many :wingmans, :through => :wingmanships
  has_many :inverse_wingmanships, :class_name => "Wingmanship", :foreign_key => "wingman_id", :conditions => { :wingman_approved => true }
  has_many :inverse_wingmans, :through => :inverse_wingmanships, :source => :person

  has_many :sent_wingmanship_requests, :class_name => "Wingmanship", :foreign_key => "person_id", :conditions => { :wingman_approved => false }
  has_many :received_wingmanship_requests, :class_name => "Wingmanship", :foreign_key => "wingman_id", :conditions => { :wingman_approved => false }

  def suggested_wingmans
    wingman_ids = self.all_wingmanships.collect { |wsr| wsr.wingman_id }
    if wingman_ids.empty? then wingman_ids = [0] end
    Person.where( [ "id NOT IN (?)" , wingman_ids] ).where("id != ?", self.id).order(" RANDOM() ")
  end

  has_many :items, :foreign_key => :sharer_id # these are shared by person

  has_many :sharages
  has_many :shared_items, :through => :sharages, :source => :item # these are shared with person
  
  def suggested_people
    Person.where(["id != ?", self.id])
  end
  
  has_many :comments
  
  has_and_belongs_to_many :activities

end
