# Lazy Streams API

This is a demo client/server for working with a paginated API as a lazy stream.

## Setting up

If you'd like to try this out yourself:

1. Clone the project
2. Run `bundle install` in the root of the project
3. Boot a server with `bundle exec rackup`
4. Boot the client (in a separate terminal) with `ruby client.rb`

![](https://cloud.githubusercontent.com/assets/1006966/24056530/7b630612-0b1a-11e7-9b9a-83281f6b6a99.jpg)


## How it works

The `client.rb` file contains the `Names::Client` class as well as the following
lines at the end:

```ruby
client = Names::Client.new
require "pry"; binding.pry
puts "done"
```

This means running `ruby client.rb` will boot up a Pry console with the `Client`
class already loaded and an instance already created for you to play around
with.

## Data

The name popularity data was based on the US Social Security Administration's
list of most [popular names for 2015](https://www.ssa.gov/cgi-bin/popularnames.cgi)
