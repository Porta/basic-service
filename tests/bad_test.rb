class BadTest < Basic::Service
  def call
    something = args.pop
    "this is the result"
  end
end
