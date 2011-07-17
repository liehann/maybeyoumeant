# Ignores all logging calls.
class MaybeYouMeant::NilLogger
  def log(msg = nil, &block)
  end
end

