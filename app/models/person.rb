class Person < ActiveRecord::Base
  acts_as_taggable_on :knows, :needs

  belongs_to :user
  
  delegate :name, :to => :user
end
