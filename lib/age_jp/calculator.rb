module AgeJp
  class Calculator
    def initialize(birthday)
      @birthday = birthday
    end

    def age_jp

    end

    def age
      return unless @birthday
      (today.strftime('%Y%m%d').to_i - @birthday.strftime('%Y%m%d').to_i) / 10000
    end

    def today
      tokyo.now.to_datetime
    end

    private

    def tokyo
      Time.zone = 'Asia/Tokyo'
      Time.zone
    end
  end
end
