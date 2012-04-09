class TagsController < ApplicationController
  def show
    @tag = ActsAsTaggableOn::Tag.find_by_name(params[:id])
    @people = Person.tagged_with(@tag.name).uniq
  end
end
