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

    def insurance_age_at(date = today)
      return unless valid_birthday? && valid_date?(date)

      # date時点での満年齢を取得
      age = calculate_age(date)

      # その年齢に到達した誕生日を取得
      last_birthday = @birthday.next_year(age)

      # 前回の誕生日から計算基準日までの月差分を取得
      month_diff = (date.year * 12 + date.month) - (last_birthday.year * 12 + last_birthday.month)

      # 月差分だけlast_birthdayをmonths_sinceした日付と、dateを比較し、month_diffの値を調整する
      # ex)
      #   - last_birthday: 1/25
      #   - date:          2/15
      #   の場合、month_diffは、1だが、実際には0ヶ月差分としたい
      #   - last_birthday.months_since(month_diff)  => 2/25
      #   として、date < last_birthday.months_since(month_diff) の場合は、month_diff -= 1 を月差分とする
      #
      # last_birthday   date    month_diff    months_since後    adjusted_month_diff
      # 2/25            2/27    0             2/25              0
      # 2/25            3/1     1             3/25              0
      # 2/25            3/27    1             3/25              1
      # 2/25            4/1     2             4/25              1
      # 2/25            4/27    2             4/25              2
      month_diff -= 1 if date < last_birthday.months_since(month_diff)

      age += 1 if month_diff > 6

      age
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
