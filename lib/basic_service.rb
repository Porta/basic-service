# encoding: UTF-8
module BasicService
  class Base

    def self.call(args)
      new(args).tap do |basic_service|
        basic_service.instance_eval do
          self.result = call
        end
      end
    end

    def success(str = '')
      @success = true
      @message = str
      @pristine = true
    end

    def error(str = '')
      @error = true
      @message = str
      @pristine = true
    end

    def initialize(*args)
      @args = args
      @success = false
      @error = false
      @pristine = false
    end

    attr_accessor :result
    attr_reader :args, :message
    private :result=, :args

    # Defaults to the boolean'ed result of "call"
    def success?
      raise RuntimeError, "#success or #error should be called inside #call" unless @pristine
      raise RuntimeError, "both #success and #error where called" if (@success && @error)
      @success && !@error
    end

    # method error if call not defined
    def call
      raise NoMethodError, "Called undefined #call. You need to implement the method in the class: #{self.class.name}"
    end    
  end
end