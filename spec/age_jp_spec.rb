require 'spec_helper'

describe AgeJp do
  describe '#age' do
    context "birthday is 2000/01/01. " do
      around do |example|
        travel_to(current_date) { example.run }
      end

      let(:birthday) { Date.new(2000, 1, 1) }
      subject { birthday.age }

      context 'when today is 2014/12/30' do
        let(:current_date) { Date.new(2014, 12, 30) }
        it { is_expected.to eq 14 }
      end

      context 'when today is 2014/12/31' do
        let(:current_date) { Date.new(2014, 12, 31) }
        it { is_expected.to eq 14 }
      end

      context 'when today is 2015/1/1' do
        let(:current_date) { Date.new(2015, 1, 1) }
        it { is_expected.to eq 15 }
      end
    end

    context "birthday is 2000/02/29. " do
      let(:birthday) { Date.new(2000, 2, 29) }
      subject(:age) { birthday.age }

      context 'when today is 2015/02/28' do
        before { Timecop.freeze(Date.new(2015, 2, 28)) }

        it { expect(age).to eq 15 }
      end

      context 'when today is 2016/02/28' do
        before { Timecop.freeze(Date.new(2016, 2, 28)) }

        it { expect(age).to eq 15 }
      end

      context 'when today is 2016/2/29' do
        before { Timecop.freeze(Date.new(2016, 2, 29)) }

        it { expect(age).to eq 16 }
      end

      after { Timecop.return }
    end
  end

  describe '#age_at' do
    context "birthday is 2000/01/01. " do
      let(:birthday) { Date.new(2000, 1, 1) }
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

    context 'invalid date' do
      let(:birthday) { Date.new(2000, 1, 1) }
      let(:invalid_date) { 'String' }
      subject(:age_at) { birthday.age_at(invalid_date) }

      it { expect { subject }.to raise_error(/invalid date/) }
    end
  end

  describe '#age_jp' do
    context "birthday is 2000/01/01. " do
      let(:birthday) { Date.new(2000, 1, 1) }
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

    context "birthday is 2000/02/29. " do
      let(:birthday) { Date.new(2000, 2, 29) }
      subject(:age_jp) { birthday.age_jp }

      context 'when today is 2015/02/27' do
        before { Timecop.freeze(Date.new(2015, 2, 27)) }

        it { expect(age_jp).to eq 14 }
      end

      context 'when today is 2015/02/28' do
        before { Timecop.freeze(Date.new(2015, 2, 28)) }

        it { expect(age_jp).to eq 15 }
      end

      context 'when today is 2016/02/28' do
        before { Timecop.freeze(Date.new(2016, 2, 28)) }

        it { expect(age_jp).to eq 16 }
      end

      context 'when today is 2016/2/29' do
        before { Timecop.freeze(Date.new(2016, 2, 29)) }

        it { expect(age_jp).to eq 16 }
      end

      after { Timecop.return }
    end
  end

  describe '#age_jp_at' do
    context "birthday is 2000/01/01. " do
      let(:birthday) { Date.new(2000, 1, 1) }
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

  describe '#east_asian_age_reckoning' do
    context "birthday is 1999/12/31. " do
      let(:birthday) { Date.new(1999, 12, 31) }

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
  end

  describe '#east_asian_age_reckoning_at' do
    context "birthday is 1999/12/31. " do
      let(:birthday) { Date.new(1999, 12, 31) }
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

  describe '#to_years_old' do
    subject { birthday.to_years_old(year) }

    context 'with birthday is 2000/01/01' do
      let(:birthday) { Date.new(2000, 1, 1) }

      context 'with year is 16' do
        let(:year) { 16 }

        it { is_expected.to eq Date.new(2016, 1, 1) }
      end

      context 'with year is 17' do
        let(:year) { 17 }

        it { is_expected.to eq Date.new(2017, 1, 1) }
      end
    end

    context 'with birthday is 2000/02/29' do
      let(:birthday) { Date.new(2000, 2, 29) }

      context 'with year is 16' do
        let(:year) { 16 }

        it { is_expected.to eq Date.new(2016, 2, 29) }
      end

      context 'with year is 17' do
        let(:year) { 17 }

        it { is_expected.to eq Date.new(2017, 2, 28) }
      end
    end
  end

  describe '#to_years_old_jp' do
    subject { birthday.to_years_old_jp(year) }

    context 'with birthday is 2000/01/01' do
      let(:birthday) { Date.new(2000, 1, 1) }

      context 'with year is 16' do
        let(:year) { 16 }

        it { is_expected.to eq Date.new(2015, 12, 31) }
      end

      context 'with year is 17' do
        let(:year) { 17 }

        it { is_expected.to eq Date.new(2016, 12, 31) }
      end
    end

    context 'with birthday is 2000/02/29' do
      let(:birthday) { Date.new(2000, 2, 29) }

      context 'with year is 16' do
        let(:year) { 16 }

        it { is_expected.to eq Date.new(2016, 2, 28) }
      end

      context 'with year is 17' do
        let(:year) { 17 }

        it { is_expected.to eq Date.new(2017, 2, 28) }
      end
    end
  end

  describe '#insurance_age' do
    context "birthday is 2000/01/01. " do
      let(:birthday) { Date.new(2000, 1, 1) }
      subject(:insurance_age) { birthday.insurance_age }

      context 'when today is 2015/01/01' do
        before { Timecop.freeze(Date.new(2015, 1, 1)) }

        it { expect(insurance_age).to eq 15 }
      end

      context 'when today is 2015/07/31' do
        before { Timecop.freeze(Date.new(2015, 7, 31)) }

        it { expect(insurance_age).to eq 15 }
      end

      context 'when today is 2015/08/01' do
        before { Timecop.freeze(Date.new(2015, 8, 1)) }

        it { expect(insurance_age).to eq 16 }
      end

      after { Timecop.return }
    end

    context "birthday is 2000/07/31. " do
      let(:birthday) { Date.new(2000, 7, 31) }
      subject(:insurance_age) { birthday.insurance_age }

      context 'when today is 2016/02/28' do
        before { Timecop.freeze(Date.new(2016, 2, 28)) }

        it { expect(insurance_age).to eq 15 }
      end

      context 'when today is 2016/02/29' do
        before { Timecop.freeze(Date.new(2016, 2, 29)) }

        it { expect(insurance_age).to eq 16 }
      end

      context 'when today is 2016/03/01' do
        before { Timecop.freeze(Date.new(2016, 3, 1)) }

        it { expect(insurance_age).to eq 16 }
      end

      after { Timecop.return }
    end
  end
end
