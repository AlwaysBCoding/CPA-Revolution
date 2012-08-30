class Numeric
  def roundup(nearest)
    self % nearest == 0 ? self : self + nearest - (self % nearest)
  end
  def add_commas
    self.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end
end

class String
  def add_commas
    self.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end
end