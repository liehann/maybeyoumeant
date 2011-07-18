require 'matrix'

class Matrix
  def []=(i, j, v)
    @rows[i][j] = v
  end
end
