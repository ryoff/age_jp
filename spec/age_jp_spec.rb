require 'spec_helper'

describe AgeJp do
  let(:age_jp) { AgeJp::Calculator.new(Date.new(1999, 1, 1)) }

  describe '#initialize' do
  end

  describe '#age_jp' do
  end

  describe '#age' do
  end

  describe '#today' do
    it 'return instance of DateTime' do
      expect(age_jp.today).to be_a(DateTime)
    end

    context 'when today is 2014/12/31' do
      before { Timecop.freeze(Time.new(2014, 12, 31)) }
      it 'return 2014/12/24' do
        expect(age_jp.today.year).to eq 2014
        expect(age_jp.today.mon).to  eq 12
        expect(age_jp.today.day).to  eq 31
      end
    end
  end
end
