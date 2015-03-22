# basic_service

Simple class for a simple service object implementation.

While there are a few different implementations for this pattern out there, this particular has a few unique (I think) features.

  - It forces you to call `success()` or `error()` inside the `call()` method in order to access the `result?` method (or it will raise a `RuntimeError` if you haven't)

  - It raises a `RuntimeError` if both `success()` and `error()` are called.

  - It allows a return value independently of the `message` method.


## Usage

```ruby
# Gemfile
gem 'basic_service'


# my_service.rb
class MyService < Basic::Service

  def call
    first_param = args.pop #args contains the parameters passed to the call function
    if first_param == "foo"
      success('foo found') # call #success() to make #success? return true.
    else
      error('foo not found') # calling #error() will make #success? return false
    end
    "I'm done"  #this return value is passed as result from the #call() method itself,
                #independently from the #success? and #message methods
  end

end

# somewhere_else.rb
require_relative 'my_service'

service = MyService.call('foo')

service.success?
# => true
service.message
# => "foo found"
service.error?
# => false
service.result
# => "I'm done"

service = MyService.call('bar')

service.success?
# => false
service.message
# => "foo not found"
service.error?
# => true
service.result
# => "I'm done"

```

## More to come
