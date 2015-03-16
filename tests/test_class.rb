#! /usr/bin/env ruby
require 'minitest/autorun'
require_relative '../lib/basic_service'

class TestClass < Minitest::Test

  def test_success_should_work
    require_relative './helper.rb'
    test = Test.call('mimimi')
    assert_equal test.success?, true
    assert_equal test.message, "success is great"
  end

  def test_error_should_work
    require_relative './helper.rb'
    test = Test.call('mandanga')
    assert_equal test.success?, false
    assert_equal test.message, "error is for loosers"
  end

  def test_result
    require_relative './helper.rb'
    test = Test.call('mimimi')
    assert_equal test.result, "this is the result"
  end


end