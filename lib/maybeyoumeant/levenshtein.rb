class MaybeYouMeant::Levenshtein
  # Computes the Levenshtein distance between two strings.
  #
  # This is currently completely unoptimized, both in terms
  # of space and time. Two planned optimizations are to only
  # use two rows instead of a matrix, and as ultimately we only
  # care about a threshold distance we only need to calculate
  # a diagonal instead of the full distance. This could be
  # further optimized to be evaluated lazily.
  #
  # If max is provided the return value is the Levenshtein distance if it
  # is less than max, otherwise it is any value greater than or equal to
  # max.
  def self.distance(s, t, max = nil)
    m = s.length
    n = t.length

    # If the string lengths differ by more than max return immediately.
    return max if max && (m - n).abs >= max

    cur = Array.new(n + 1, 0)
    nxt = Array.new(n + 1, 0)

    0.upto n do |j|
      cur[j] = j
    end

    1.upto m do |i|
      nxt[0] = i
      1.upto n do |j|
        # This is not unicode safe.
        if s[i - 1] == t[j - 1]
          nxt[j] = cur[j - 1]
        else
          nxt[j] = [
            cur[j] + 1,      #deletion
            nxt[j - 1] + 1,  #insertion
            cur[j - 1] + 1,  #substitution
          ].min
        end
      end
      tmp = cur
      cur = nxt
      nxt = tmp
    end
    
    return cur[n]
  end
end
