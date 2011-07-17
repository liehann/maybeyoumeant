# Extends Object to call a method similar to the one called when the 
# method has not been defined on the object.
module MaybeYouMeant::ObjectExtentions

  module InstanceMethods
    # Calls a nearby method if one is found. If no nearby method is
    # found the original method_missing is called, which raises a
    # NoMethodError.
    def method_missing(method, *args, &block)
      nearby = nearby_method(method)
      # MaybeYouMeant.log { "Maybe you meant to call #{nearby}?" } if nearby
      return super unless MaybeYouMeant::Config.call_nearby && nearby
      MaybeYouMeant.tweak_history(method, nearby)
      return send(nearby, *args, &block)
    end

    # Returns the closest matching method to methods already defined on the object.
    def nearby_method(name)
      max_distance = 2
      max_distance = 1 if name.to_s.length <= 3

      distance = {}
      nearby_methods = self.methods.select do |method|
        d = MaybeYouMeant::Levenshtein.distance(name.to_s, method.to_s)
        distance[method] = d if d <= max_distance
        d <= max_distance
      end
      return nil if nearby_methods.empty?
      nearby_methods.sort! do |method, other|
        distance[method] <=> distance[other]
      end
      nearby_methods[0]
    end

  end

  # Add the instance methods to the base object.
  Object.send(:include, InstanceMethods)
end

