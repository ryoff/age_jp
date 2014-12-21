module AgeJp
  class Calculator
    def initialize(birthday)
      @birthday = birthday
    end

    def age
      return unless valid_birthday?

      calculate_age(today)
    end

    def age_at(date)
      return unless valid_birthday? && valid_date?(date)

      calculate_age(date)
    end

    def age_jp
      return unless valid_birthday?

      calculate_age_jp(today)
    end

    def age_jp_at(date)
      return unless valid_birthday? && valid_date?(date)

      calculate_age_jp(date)
    end

    def east_asian_age_reckoning
      return unless valid_birthday?

      age = calculate_age(today)
      until_birthday_this_year?(today) ? age + 2 : age + 1
    end

    def east_asian_age_reckoning_at(date)
      return unless valid_birthday? && valid_date?(date)

      age = calculate_age(date)
      until_birthday_this_year?(date) ? age + 2 : age + 1
    end

    def today
      Date.today
    end

    private

    def calculate_age_jp(date)
      (calculate_age(date) - calculate_age(date.days_since(1))).zero? ? calculate_age(date) : calculate_age(date.days_since(1))
    end

    def calculate_age(date)
      (date.strftime('%Y%m%d').to_i - @birthday.strftime('%Y%m%d').to_i) / 10_000
    end

    def until_birthday_this_year?(date)
      date.strftime('%m%d').to_i < @birthday.strftime('%m%d').to_i
    end

    def valid_birthday?
      valid_date?(@birthday)
    end

    def valid_date?(date)
      raise ArgumentError, 'invalid date' unless date && date.is_a?(Date)
      true
    end
  end
end
