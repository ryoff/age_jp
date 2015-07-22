module AgeJp
  class Calculator
    def initialize(birthday)
      @birthday = birthday
    end

    def age_at(date = today)
      return unless valid_birthday? && valid_date?(date)

      calculate_age(date)
    end

    def age_jp_at(date = today)
      return unless valid_birthday? && valid_date?(date)

      calculate_age_jp(date)
    end

    def east_asian_age_reckoning_at(date = today)
      return unless valid_birthday? && valid_date?(date)

      age = calculate_age(date)
      until_birthday_this_year?(date) ? age + 2 : age + 1
    end

    private

    def today
      Date.today
    end

    def calculate_age_jp(date)
      # 誕生日が閏日の場合は、日本の民法ではdateが閏年であろうとなかろうと、2/28に年齢加算される
      # つまり、誕生日が閏日 かつ dateが2/27の場合は、閏年であろうと無かろうと、年齢加算しない
      return calculate_age(date) if leap_date?(@birthday) && february_twenty_seven?(date)

      (calculate_age(date) - calculate_age(date.tomorrow)).zero? ? calculate_age(date) : calculate_age(date.tomorrow)
    end

    def calculate_age(date)
      date_ymd_to_i     = date.strftime('%Y%m%d').to_i
      birthday_ymd_to_i = @birthday.strftime('%Y%m%d').to_i

      # 誕生日が閏日 かつ dateが閏年ではない場合
      birthday_ymd_to_i -= 1 if leap_date?(@birthday) && !date.leap?

      (date_ymd_to_i - birthday_ymd_to_i) / 10_000
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

    def leap_date?(date)
      date.leap? && date.month == 2 && date.day == 29
    end

    def february_twenty_seven?(date)
      date.month == 2 && date.day == 27
    end
  end
end
