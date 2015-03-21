#! /usr/bin/env ruby
require 'minitest/autorun'
require_relative '../lib/basic_service'

require_relative './good_test.rb'
require_relative './bad_test.rb'
require_relative './ugly_test.rb'

class TestClass < Minitest::Test

  def test_success_should_work
    test = GoodTest.call('mimimi')
    assert_equal test.success?, true
    assert_equal test.message, "success is great"
  end

  def test_error_should_work
    test = GoodTest.call('mandanga')
    assert_equal test.success?, false
    assert_equal test.message, "error is for loosers"
  end

  def test_result
    test = GoodTest.call('mimimi')
    assert_equal test.result, "this is the result"
  end


  def test_raise_if_not_pristine
    test = BadTest.call('mimimi')
    exception = assert_raises(RuntimeError) { test.success? }
    assert_equal("#success or #error should be called inside #call", exception.message) 
  end

  def test_raise_if_success_and_error
    test = UglyTest.call('Pistola')
    exception = assert_raises(RuntimeError) { test.success? }
    assert_equal("both #success and #error where called", exception.message) 
  end


end
