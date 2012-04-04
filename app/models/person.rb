class Person < ActiveRecord::Base
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
    Person.find_by_sql(["SELECT people.* FROM people, wingmanships " +
                        "WHERE people.id = wingmanships.wingman_id AND " +
                        "wingmanships.person_id != ? AND " +
                        "people.id != ?", self.id, self.id])
    #.where(["id != ?", self.id])
  end

  has_many :original_items, :class_name => "Item", :foreign_key => :original_creator_id

end
