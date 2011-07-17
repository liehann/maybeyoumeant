# Logs to STDERR.
class MaybeYouMeant::StdErrLogger
  def log(msg = nil, &block)
    msg ||= yield if block_given?
    STDERR.puts(msg)
  end
end

