class Person < ActiveRecord::Base
  acts_as_taggable_on :knows, :needs

  belongs_to :user
  
  delegate :name, :to => :user
  
  has_many :wingmanships
  has_many :wingmans, :through => :wingmanships
  has_many :inverse_wingmanships, :class_name => "Wingmanship", :foreign_key => "wingman_id"
  has_many :inverse_wingmans, :through => :inverse_wingmanships, :source => :person
end
