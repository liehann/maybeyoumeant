require 'matrix'

class MaybeYouMeant::Matrix

  module InstanceMethods
    def []=(i, j, v)
      @rows[i][j] = v
    end
  end

  # Add matrix methods if this is ruby 1.8 and they're not present.
  unless ::Matrix.instance_methods.include?(:[]=)
    ::Matrix.send(:include, InstanceMethods)
  end
end
