class BadTest < BasicService::Base
  def call
    something = args.pop
    "this is the result"
  end
end
