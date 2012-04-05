class Item < ActiveRecord::Base

  belongs_to :sharer, :class_name => "Person"
  
  acts_as_taggable
  
  has_many :sharages
  has_many :listeners, :through => :sharages, :source => :person
end
