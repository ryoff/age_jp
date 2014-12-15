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

  describe '#today' do
    it 'return instance of DateTime' do
      expect(age_jp.today).to be_a(DateTime)
    end

    context 'when today is 2014/12/31' do
      before { Timecop.freeze(Time.new(2014, 12, 31)) }

      it 'return 2014/12/31' do
        expect(age_jp.today.strftime('%Y/%m/%d')).to eq '2014/12/31'
      end
    end
  end

  describe '#yesterday' do
    it 'return instance of DateTime' do
      expect(age_jp.yesterday).to be_a(DateTime)
    end

    context 'when today is 2014/12/31' do
      before { Timecop.freeze(Time.new(2014, 12, 31)) }

      it 'return 2014/12/30' do
        expect(age_jp.yesterday.strftime('%Y/%m/%d')).to eq '2014/12/30'
      end
    end
  end

  describe '#tomorrow' do
    it 'return instance of DateTime' do
      expect(age_jp.tomorrow).to be_a(DateTime)
    end

    context 'when today is 2014/12/31' do
      before { Timecop.freeze(Time.new(2014, 12, 31)) }

      it 'return 2015/01/01' do
        expect(age_jp.tomorrow.strftime('%Y/%m/%d')).to eq '2015/01/01'
      end
    end
  end
end
