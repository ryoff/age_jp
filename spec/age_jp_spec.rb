require 'spec_helper'

describe AgeJp do
  let(:age_jp) { AgeJp::Calculator.new(Date.new(2000, 1, 1)) }

  describe '#initialize' do
  end

  describe '#age' do
    context 'when today is 2014/12/30' do
      before { Timecop.freeze(Time.new(2014, 12, 30)) }

      it 'return 14' do
        expect(age_jp.age).to eq 14
      end
    end

    context 'when today is 2014/12/31' do
      before { Timecop.freeze(Time.new(2014, 12, 31)) }

      it 'return 15' do
        expect(age_jp.age).to eq 15
      end
    end

    context 'when today is 2015/1/1' do
      before { Timecop.freeze(Time.new(2015, 1, 1)) }

      it 'return 15' do
        expect(age_jp.age).to eq 15
      end
    end
  end

  describe '#age_at' do
    let(:date) { Date.new(2016, 12, 30) }

    context 'when date is 2016/12/30' do
      it 'return 16' do
        expect(age_jp.age_at(date)).to eq 16
      end
    end

    context 'when date is 2014/12/31' do
      it 'return 17' do
        expect(age_jp.age_at(date + 1.day)).to eq 17
      end
    end

    context 'when date is 2015/1/1' do
      it 'return 17' do
        expect(age_jp.age_at(date + 2.days)).to eq 17
      end
    end
  end

  describe '#age_non_jp' do
    context 'when today is 2014/12/30' do
      before { Timecop.freeze(Time.new(2014, 12, 30)) }

      it 'return 14' do
        expect(age_jp.age_non_jp).to eq 14
      end
    end

    context 'when today is 2014/12/31' do
      before { Timecop.freeze(Time.new(2014, 12, 31)) }

      it 'return 14' do
        expect(age_jp.age_non_jp).to eq 14
      end
    end

    context 'when today is 2015/1/1' do
      before { Timecop.freeze(Time.new(2015, 1, 1)) }

      it 'return 15' do
        expect(age_jp.age_non_jp).to eq 15
      end
    end
  end

  describe '#age_non_jp_at' do
    let(:date) { Date.new(2016, 12,30) }
    context 'when date is 2014/12/30' do
      it 'return 16' do
        expect(age_jp.age_non_jp_at(date)).to eq 16
      end
    end

    context 'when date is 2014/12/31' do
      it 'return 16' do
        expect(age_jp.age_non_jp_at(date + 1.day)).to eq 16
      end
    end

    context 'when date is 2015/1/1' do
      it 'return 17' do
        expect(age_jp.age_non_jp_at(date + 2.days)).to eq 17
      end
    end
  end

  describe '#east_asian_age_reckoning' do
    let(:age_jp) { AgeJp::Calculator.new(Date.new(1999, 12, 31)) }

    context 'when birthday is 1999/12/31' do
      context 'when today is 1999/12/31' do
        before { Timecop.freeze(Time.new(1999, 12, 31)) }

        it 'return 1' do
          expect(age_jp.east_asian_age_reckoning).to eq 1
        end
      end

      context 'when today is 2000/1/1' do
        before { Timecop.freeze(Time.new(2000, 1, 1)) }

        it 'return 2' do
          expect(age_jp.east_asian_age_reckoning).to eq 2
        end
      end

      context 'when today is 2000/12/31' do
        before { Timecop.freeze(Time.new(2000, 12, 31)) }

        it 'return 2' do
          expect(age_jp.east_asian_age_reckoning).to eq 2
        end
      end
    end
  end

  describe '#today' do
    it 'return instance of Date' do
      expect(age_jp.today).to be_a(Date)
    end

    context 'when today is 2014/12/31' do
      before { Timecop.freeze(Time.new(2014, 12, 31)) }

      it 'return 2014/12/31' do
        expect(age_jp.today.strftime('%Y/%m/%d')).to eq '2014/12/31'
      end
    end
  end
end
