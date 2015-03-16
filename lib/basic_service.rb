# encoding: UTF-8
module BasicService
  class Base
    SUCCESS = 'success'
    ERROR = 'error'

    def self.call(args)
      new(args).tap do |basic_service|
        basic_service.instance_eval do
          self.result = call
        end
      end
    end

    def success(str = '')
      @success = SUCCESS
      @message = str
      @pristine = true
    end

    def error(str = '')
      @error = ERROR
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
      SUCCESS == @success
    end

    # method error if call not defined
    def call
      raise NoMethodError, "Called undefined #call. You need to implement the method in the class: #{self.class.name}"
    end    
  end
end