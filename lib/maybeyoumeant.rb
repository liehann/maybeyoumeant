module MaybeYouMeant; end

require 'rubygems'
require 'paint'

require 'maybeyoumeant/config'
require 'maybeyoumeant/levenshtein'
require 'maybeyoumeant/object_extensions'
require 'maybeyoumeant/nil_logger'
require 'maybeyoumeant/std_err_logger'

module MaybeYouMeant
  @logger = StdErrLogger.new
  def self.logger=(logger)
    @logger = logger
  end

  # Logs a message to the current logger.
  # The current logger is either STDOUT (be default), or a
  # nil logger if debug is disabled.
  def self.log(msg = nil, &block)
    @logger.log(msg, &block)
  end

  # Returns true if in an IRB session, false if not.
  def self.irb_session?
    begin
      @irb ||= Kernel.const_get('IRB') && Kernel.const_get('Readline') && Readline.const_defined?('HISTORY')
    rescue NameError
      @irb = false
    end
    return @irb
  end

  # Updates IRB history to include the fixed command.
  # For example if:
  #  'hello'.ucase
  # is executed, IRB history will be update with
  #  'hello'.upcase
  def self.tweak_history(method, nearby)
    return unless irb_session? && !Readline::HISTORY.empty?

    line = Readline::HISTORY[Readline::HISTORY.size - 1]
    Readline::HISTORY.pop if Config::remove_from_history

    # Try to match .#{method}\W before replacing all occurrences of method.
    line.gsub!(/(\W|^)#{method.to_s}((?=\W)|$)/, "\\1#{nearby.to_s}")
    log((Paint["Maybe you meant: ", :red]) + line.to_s)

    Readline::HISTORY.push line if Config.add_to_history
  end

  MaybeYouMeant::ObjectExtentions.install_instance_methods
end

