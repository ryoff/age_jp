class Date
  def age
    AgeJp::Calculator.new(self).age_at
  end

  def age_at(date)
    AgeJp::Calculator.new(self).age_at(date)
  end

  def age_jp
    AgeJp::Calculator.new(self).age_jp_at
  end

  def age_jp_at(date)
    AgeJp::Calculator.new(self).age_jp_at(date)
  end

  def east_asian_age_reckoning
    AgeJp::Calculator.new(self).east_asian_age_reckoning_at
  end

  def east_asian_age_reckoning_at(date)
    AgeJp::Calculator.new(self).east_asian_age_reckoning_at(date)
  end

  def insurance_age
    AgeJp::Calculator.new(self).insurance_age_at
  end

  def insurance_age_at(date)
    AgeJp::Calculator.new(self).insurance_age_at(date)
  end

  alias_method :to_years_old, :next_year

  def to_years_old_jp(n)
    return to_years_old(n).change(day: 28) if leap? && month == 2 && day == 29

    to_years_old(n).yesterday
  end
end
