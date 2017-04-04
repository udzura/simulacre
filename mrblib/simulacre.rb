module Simulacre
  def self.clock_gettime(clk_id, ts)
    if rand(2) == 0
      Simulacre.super
    else
      ts.sec = rand(10000)
    end
    return true
  end
end

# def __main__(argv)
#   if argv[1] == "version"
#     puts "v#{Simulacre::VERSION}"
#   else
#     puts "Hello World"
#   end
# end
