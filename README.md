# AgeJp

[![Build Status](https://travis-ci.org/ryoff/age_jp.svg?branch=master)](https://travis-ci.org/ryoff/age_jp)

日本の法律に則った年齢計算です
[年齢計算ニ関スル法律 - Wikipedia](http://ja.wikipedia.org/wiki/%E5%B9%B4%E9%BD%A2%E8%A8%88%E7%AE%97%E3%83%8B%E9%96%A2%E3%82%B9%E3%83%AB%E6%B3%95%E5%BE%8B)

>年を取る日は誕生日の前日となる

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'age_jp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install age_jp

## Usage

```lang:age_jp.rb
Timecop.freeze(Time.new(2014, 12, 31))

birthday = Date.new(2000, 1, 1)
birthday.age                                      # 14 (通常の年齢)
birthday.age_at(Date.today)                       # same as birthday.age
birthday.age_jp                                   # 15 (日本の法律準拠)
birthday.age_jp_at(Date.today)                    # same as birthday.age_jp
birthday.east_asian_age_reckoning                 # 15 (数え年)
birthday.east_asian_age_reckoning_at(Date.today)  # same as birthday.east_asian_age_reckoning
birthday.insurance_age                            # 14 (保険年齢)
birthday.insurance_age_at(Date.today)             # same as birthday.insurance_age
birthday.to_years_old(17)                         # 2017/01/01. 17歳の誕生日を返却
birthday.to_years_old_jp(17)                      # 2016/12/31. 17歳の年齢加算日(日本の法律準拠)を返却
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/age_jp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
