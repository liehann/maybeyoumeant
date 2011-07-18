module MaybeYouMeant; end

require 'rubygems'
require 'rainbow'

require 'maybeyoumeant/matrix'
require 'maybeyoumeant/levenshtein'
require 'maybeyoumeant/object_extensions'
require 'maybeyoumeant/nil_logger'
require 'maybeyoumeant/std_err_logger'
require 'maybeyoumeant/config'

module MaybeYouMeant
  @logger = StdErrLogger.new
  def self.logger=(logger)
    @logger = logger
  end

  def self.log(msg = nil, &block)
    # msg ||= yield if block_given?
    @logger.log(msg, &block)
  end


  def self.tweak_history(method, nearby)
    begin
      @irb ||= Kernel.const_get('IRB') && Kernel.const_get('Readline') && Readline.const_defined?('HISTORY')
    rescue NameError
      @irb = false
    end
    return unless @irb

    line = Readline::HISTORY[-1]
    Readline::HISTORY.pop if Config::remove_from_history

    # Try to match .#{method}\W before replacing all occurrences of method.
    line.gsub!(/(\W|^)#{method}((?=\W)|$)/, "\\1#{nearby}")
    log("Maybe you meant: #{line}".foreground(:black).bright)

    Readline::HISTORY.push line if Config.add_to_history
  end
end

