# FlogAndChurn

This gem combines complexity metrics (flog), and frequency of change metrics (churn) in one visualisation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'flog_and_churn'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install flog_and_churn
```

## Usage

Add the following to your rakefile

```ruby
task :flog_and_churn do
    FlogAndChurnRunner.run
end
```

And you are ready to generate the report using

```sh
$ bundle exec rake flog_and_churn
```

Finally, open the report (on a mac) with

```sh
open reports/index.html
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/flog_and_churn/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## REFERENCES

https://google-developers.appspot.com/chart/interactive/docs/gallery/scatterchart
https://google-developers.appspot.com/chart/interactive/docs/roles

