class Item < ActiveRecord::Base
  belongs_to :original_creator, :class_name => "Person"
end
