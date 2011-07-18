module MaybeYouMeant::Config
  # Set to true to log when a nearby message is automatically called.
  # Default value is true.
  def self.debug=(enabled)
    raise 'Debug can only be set to true or false.' unless enabled == true || enabled == false
    if enabled
      MaybeYouMeant.logger = MaybeYouMeant::StdErrLogger.new
    else
      MaybeYouMeant.logger = MaybeYouMeant::NilLogger.new
    end
  end

  # Indicates if debug logger is currently enabled.
  def self.debug
    MaybeYouMeant::StdErrLogger === MaybeYouMeant.logger
  end

  @call_nearby = true

  # When true if a nearby method is found it is automatically called.
  # Defaults to true.
  def self.call_nearby=(enabled)
    @call_nearby = enabled
  end

  def self.call_nearby
    @call_nearby
  end

  @add_to_history = true

  # When true and a nearby method is called the history is manipulated to
  # have the nearby method name. Defaults to true.
  # This is done with a simple search and replace and may not be perfect,
  # especially for short methods.
  # Say object foo has a method 'foob' you will get the following in your history:
  # foo.foo -> foob.foob
  def self.add_to_history=(enabled)
    @add_to_history = true
  end

  def self.add_to_history
    @add_to_history
  end

  @remove_from_history = false

  # When true and a nearby method is called the history is manipulated to
  # have the line with the incorrect method name removed.
  # Defaults to false.
  def self.remove_from_history(enabled)
    @remove_from_history = enabled
  end

  def self.remove_from_history
    @remove_from_history
  end

  @ask_user = false

  # When true, the nearby method is not called directly, but the user
  # can decide if he wants to call it
  # Defaults to false
  def self.ask_user=(enabled)
    @ask_user = enabled
  end

  def self.ask_user
    @ask_user
  end

end
