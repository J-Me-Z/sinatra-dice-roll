require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
erb(:elephant)
end

#get("/") do
 # "Hello World"
#end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server"
end

# get("/dice/2/6") do
#   first_die = rand(1..6)
#   second_die = rand(1..6)
#   sum = first_die + second_die
	
#   @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

get("/dice/2/6") do
  @rolls = []

  2.times do
    die = rand(1..6)

    @rolls.push(die)
  end
	
erb(:two_six, {:layout => :wrapper})
  # "<h1>2d6</h1>
  #  <p>#{outcome}</p>"
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_ten, {:layout => :wrapper})
	
  # "<h1>2d10</h1>
  #  <p>#{outcome}</p>"
end

get("/dice/1/20") do
  @die= rand(1..20)
 # second_die = rand(1..20)
  
	
  @outcome = "You rolled a #{@die}."
 # and a {second_die} for a total of #{sum}."

 erb(:one_twenty, {:layout => :wrapper})
	
  # "<h1>1d20</h1>
  #  <p>#{outcome}</p>"
end

get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die}  and a #{third_die} and a #{fourth_die} and a #{fifth_die} for a total of #{sum}."

  erb(:four_five, {:layout => :wrapper})

	
  # "<h1>5d4</h1>
  #  <p>#{outcome}</p>"
end

get("/dice/100/6") do
  @rolls = []

  100.times do
    die = rand(1..6)

    @rolls.push(die)
  end

  erb(:one_hundred_six, {:layout => :wrapper})
end
