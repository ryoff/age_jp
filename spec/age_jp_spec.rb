require 'spec_helper'

describe AgeJp do
  context "birthday is 2000/01/01. " do
    let(:birthday) { Date.new(2000, 1, 1) }

    describe '#age' do
      subject(:age) { birthday.age }

      context 'when today is 2014/12/30' do
        before { Timecop.freeze(Date.new(2014, 12, 30)) }

        it { expect(age).to eq 14 }
      end

      context 'when today is 2014/12/31' do
        before { Timecop.freeze(Date.new(2014, 12, 31)) }

        it { expect(age).to eq 14 }
      end

      context 'when today is 2015/1/1' do
        before { Timecop.freeze(Date.new(2015, 1, 1)) }

        it { expect(age).to eq 15 }
      end

      after { Timecop.return }
    end

    describe '#age_at' do
      subject(:age_at) { birthday.age_at(today) }

      context 'when date is 2016/12/30' do
        let(:today) { Date.new(2016, 12, 30) }

        it { expect(age_at).to eq 16 }
      end

      context 'when date is 2016/12/31' do
        let(:today) { Date.new(2016, 12, 31) }

        it { expect(age_at).to eq 16 }
      end

      context 'when date is 2017/1/1' do
        let(:today) { Date.new(2017, 1, 1) }

        it { expect(age_at).to eq 17 }
      end
    end

    describe '#age_jp' do
      subject(:age_jp) { birthday.age_jp }

      context 'when today is 2014/12/30' do
        before { Timecop.freeze(Date.new(2014, 12, 30)) }

        it { expect(age_jp).to eq 14 }
      end

      context 'when today is 2014/12/31' do
        before { Timecop.freeze(Date.new(2014, 12, 31)) }

        it { expect(age_jp).to eq 15 }
      end

      context 'when today is 2015/1/1' do
        before { Timecop.freeze(Date.new(2015, 1, 1)) }

        it { expect(age_jp).to eq 15 }
      end

      after { Timecop.return }
    end

    describe '#age_jp_at' do
      subject(:age_jp_at) { birthday.age_jp_at(today) }

      context 'when date is 2016/12/30' do
        let(:today) { Date.new(2016, 12, 30) }

        it { expect(age_jp_at).to eq 16 }
      end

      context 'when date is 2016/12/31' do
        let(:today) { Date.new(2016, 12, 31) }

        it { expect(age_jp_at).to eq 17 }
      end

      context 'when date is 2017/1/1' do
        let(:today) { Date.new(2017, 1, 1) }

        it { expect(age_jp_at).to eq 17 }
      end
    end
  end

  context "birthday is 1999/12/31. " do
    let(:birthday) { Date.new(1999, 12, 31) }

    describe '#east_asian_age_reckoning' do
      subject(:east_asian_age_reckoning) { birthday.east_asian_age_reckoning }

      context 'when today is 1999/12/31' do
        before { Timecop.freeze(Date.new(1999, 12, 31)) }

        it { expect(east_asian_age_reckoning).to eq 1 }
      end

      context 'when today is 2000/01/01' do
        before { Timecop.freeze(Date.new(2000, 1, 1)) }

        it { expect(east_asian_age_reckoning).to eq 2 }
      end

      context 'when today is 2000/12/31' do
        before { Timecop.freeze(Date.new(2000, 12, 31)) }

        it { expect(east_asian_age_reckoning).to eq 2 }
      end

      after { Timecop.return }
    end

    describe '#east_asian_age_reckoning_at' do
      subject(:east_asian_age_reckoning_at) { birthday.east_asian_age_reckoning_at(today) }

      context 'when date is 2016/12/31' do
        let(:today) { Date.new(2016, 12, 31) }

        it { expect(east_asian_age_reckoning_at).to eq 18 }
      end

      context 'when date is 2017/01/01' do
        let(:today) { Date.new(2017, 1, 1) }

        it { expect(east_asian_age_reckoning_at).to eq 19 }
      end

      context 'when date is 2017/12/31' do
        let(:today) { Date.new(2017, 12, 31) }

        it { expect(east_asian_age_reckoning_at).to eq 19 }
      end
    end
  end

  describe "sample" do
    context "birthday is 2000/01/01. and today is 2014/12/31 " do
      let(:birthday) { Date.new(2000, 1, 1) }
      before { Timecop.freeze(Date.new(2014, 12, 31)) }

      describe '#age' do
        it { expect(birthday.age).to eq 14 }
      end

      describe '#age_at(date)' do
        it { expect(birthday.age_at(Date.today)).to eq 14 }
      end

      describe '#age_jp' do
        it { expect(birthday.age_jp).to eq 15 }
      end

      describe '#age_jp_at(date)' do
        it { expect(birthday.age_jp_at(Date.today)).to eq 15 }
      end

      describe '#east_asian_age_reckoning' do
        it { expect(birthday.east_asian_age_reckoning).to eq 15 }
      end

      describe '#east_asian_age_reckoning_at(date)' do
        it { expect(birthday.east_asian_age_reckoning_at(Date.today)).to eq 15 }
      end

      after { Timecop.return }
    end
  end
end
