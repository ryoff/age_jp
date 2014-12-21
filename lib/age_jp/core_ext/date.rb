class Date
  def age
    AgeJp::Calculator.new(self).age
  end

  def age_at(date)
    AgeJp::Calculator.new(self).age_at(date)
  end

  def age_jp
    AgeJp::Calculator.new(self).age_jp
  end

  def age_jp_at(date)
    AgeJp::Calculator.new(self).age_jp_at(date)
  end

  def east_asian_age_reckoning
    AgeJp::Calculator.new(self).east_asian_age_reckoning
  end

  def east_asian_age_reckoning_at(date)
    AgeJp::Calculator.new(self).east_asian_age_reckoning_at(date)
  end
end
