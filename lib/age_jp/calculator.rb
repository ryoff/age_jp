module AgeJp
  class Calculator
    def initialize(birthday)
      @birthday = birthday
    end

    def age
      return unless valid_birthday?

      calculate_age_jp(today)
    end

    def age_at(date)
      return unless valid_birthday? && valid_date?(date)

      calculate_age_jp(date)
    end

    def age_non_jp
      return unless valid_birthday?

      calculate_age(today)
    end

    def age_non_jp_at(date)
      return unless valid_birthday? && valid_date?(date)

      calculate_age(date)
    end

    def east_asian_age_reckoning
      return unless valid_birthday?

      age = calculate_age(today)
      until_birthday_this_year? ? age + 2 : age + 1
    end

    def today
      tokyo.now.to_date
    end

    private

    def calculate_age_jp(date)
      (calculate_age(date) - calculate_age(date.days_since(1))).zero? ? calculate_age(date) : calculate_age(date.days_since(1))
    end

    def calculate_age(date)
      (date.strftime('%Y%m%d').to_i - @birthday.strftime('%Y%m%d').to_i) / 10_000
    end

    def tokyo
      Time.zone = 'Asia/Tokyo'
      Time.zone
    end

    def until_birthday_this_year?
      today.strftime('%m%d').to_i < @birthday.strftime('%m%d').to_i
    end

    def valid_birthday?
      valid_date?(@birthday)
    end

    def valid_date?(date)
      date && date.is_a?(Date)
    end
  end
end
