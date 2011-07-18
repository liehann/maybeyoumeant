# Extends Object to call a method similar to the one called when the 
# method has not been defined on the object.
module MaybeYouMeant::ObjectExtentions
  # Not 100% sure what the problem is, but if you start mucking about
  # with the following methods in Ruby 1.9 things go horrible wrong,
  # so we just ignore them. They're likely to be correct anyway.
  IGNORE_LIST = [
    :to_str,
    :to_int,
    :to_ary,
    :to_hash,
    :to_a
  ]

  def self.user_confirmation(nearby)
    Paint["Do you want to call ", :green] +
    Paint[nearby, :green, :bright] +
    Paint[" instead?", :green] +
    " [Y,n]: "
  end

  module InstanceMethods
    # Calls a nearby method if one is found. If no nearby method is
    # found the original method_missing is called, which raises a
    # NoMethodError.
    def method_missing(method, *args, &block)
      # Don't handle methods on the ignore list.
      return super if IGNORE_LIST.include?(method)

      nearby = nearby_method(method)

      return super unless MaybeYouMeant::Config.call_nearby && nearby

      if MaybeYouMeant::Config.ask_user
        print MaybeYouMeant::ObjectExtentions.user_confirmation(nearby)
        choice = gets
        return super if !choice || choice =~ /^n/i
      end

      MaybeYouMeant.tweak_history(method, nearby)

      send(nearby, *args, &block)
    end

    # Returns the closest matching method to methods already defined on the object.
    def nearby_method(name)
      max_distance = 2
      max_distance = 1 if name.to_s.length <= 3

      distance = {}
      nearby_methods = self.methods.select do |method|
        d = MaybeYouMeant::Levenshtein.distance(name.to_s, method.to_s, max_distance + 1)
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

  def self.install_instance_methods
    # Add the instance methods to the base object.
    Object.send(:include, InstanceMethods)
  end
end

