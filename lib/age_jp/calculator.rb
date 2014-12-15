module AgeJp
  class Calculator
    def initialize(birthday)
      @birthday = birthday
    end

    def age
      return unless valid_birthday?

      (calculate_age(today) - calculate_age(tomorrow)).zero? ? calculate_age(today) : calculate_age(tomorrow)
    end

    def age_at(date)
      return unless valid_birthday? && valid_date?(date)

      (calculate_age(date) - calculate_age(date.days_since(1))).zero? ? calculate_age(date) : calculate_age(date.days_since(1))
    end

    def age_non_jp
      return unless valid_birthday?

      calculate_age(today)
    end

    def age_non_jp_at(date)
      return unless valid_birthday? && valid_date?(date)

      calculate_age(date)
    end

    def today
      tokyo.now.to_datetime
    end

    def yesterday
      today.yesterday
    end

    def tomorrow
      today.tomorrow
    end

    private

    def calculate_age(datetime)
      (datetime.strftime('%Y%m%d').to_i - @birthday.strftime('%Y%m%d').to_i) / 10_000
    end

    def tokyo
      Time.zone = 'Asia/Tokyo'
      Time.zone
    end

    def valid_birthday?
      valid_date?(@birthday)
    end

    def valid_date?(date)
      date && date.is_a?(Date)
    rescue
      raise ArgumentError, 'invalid date'
    end
  end
end
