class UglyTest < Basic::Service
  def call
    something = args.pop
    success("success is great")
    error("error is for loosers")
    "this is the result"
  end
end
