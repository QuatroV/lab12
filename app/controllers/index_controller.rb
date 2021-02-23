class IndexController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def input
  end

  def output
    arg = Float(params[:num])
    SquareRoot.create(num: arg,res: calculate(arg).join(" ")) unless SquareRoot.exists?(num: arg)
    @res = SquareRoot.find_by(num: arg).res.split(" ").map{|el| Float(el)}
  end

  def calculate(arg)
    x = []
    x[0] = arg
    i = 1
    while (x[i-1]**2-arg)/arg > 0.001
      x[i] = 0.5*(x[i-1]+arg/x[i-1])
      i += 1
    end
    x
  end
end
