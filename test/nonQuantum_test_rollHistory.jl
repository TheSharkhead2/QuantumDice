include("../src/QuantumDiceSim.jl")

using .QuantumDiceSim

dice = QuantumDice((1,6), (2,5), (3,4)) # define dice

history = [] # history of rolls 

nRounds = 100 # number of rounds/roles to simulate 

for x in 1:nRounds
    push!(history, roll_dice!(dice)) # roll dice and add to history
end # for

historyOE = [x % 2 == 1 ? "odd" : "even" for x in history] # history in just odd or even 

println("Number of odd rolls: ", count(i->i=="odd", historyOE)) # count odd rolls
println("Number of even rolls: ", count(i->i=="even", historyOE)) # count even rolls

println(historyOE) # print history in just odd or even