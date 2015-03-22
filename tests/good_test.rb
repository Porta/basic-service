class GoodTest < BasicService::Base
  def call
    something = args.pop
    if something == 'mimimi'
      success("success is great")
    else
      error("error is for loosers")
    end
    "this is the result"
  end
end
