module PseudoDestroyable
  def acts_as_pseudo_destroyable
    include InstanceMethods
    alias_method_chain :destroy, :build
    default_scope where(:is_destroyed => false)
  end

  module InstanceMethods
    def destroy_with_pseudo
      self.update_attribute(:is_destroyed, true)
    end
  end
end
