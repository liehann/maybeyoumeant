class MaybeYouMeant::Levenshtein
  # Computes the Levenshtein distance between two strings.
  #
  # This is currently completely unoptimized, both in terms
  # of space and time. Two planned optimizations are to only
  # use two rows instead of a matrix, and as ultimately we only
  # care about a threshold distance we only need to calculate
  # a diagonal instead of the full distance. This could be
  # further optimized to be evaluated lazily.
  def self.distance(s, t)
    m = s.length
    n = t.length

    d = ::Matrix.rows(Array.new(m + 1) { Array.new(n + 1, 0) }, false)

    0.upto m do |i|
      d[i, 0] = i
    end

    0.upto n do |j|
      d[0, j] = j
    end

    1.upto m do |i|
      1.upto n do |j|
        # This is not unicode safe.
        if s[i - 1] == t[j - 1]
          d[i, j] = d[i - 1, j - 1]
        else
          d[i, j] = [
            d[i - 1, j] + 1,     # deletion
            d[i, j - 1] + 1,     # insertion
            d[i - 1, j - 1] + 1  # substitution
          ].min
        end
      end
    end
    
    return d[m, n]
  end
end
