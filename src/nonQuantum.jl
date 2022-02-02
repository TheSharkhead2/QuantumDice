""" 
Struct containing information for the three pairs on an given dice. A pair 
represents two sides on opposite sides of the dice. 

"""
mutable struct QuantumDice
    pair1::Tuple{Int, Int} 
    pair2::Tuple{Int, Int} 
    pair3::Tuple{Int, Int} 
end # QuantumDice

"""
Rolls the quantum dice, alters the dice by adding 1 to the opposite of the 
rolled side, and returns the rolled value. 

# Parameters 

dice::QuantumDice
    The quantum dice to roll.

# returns

value::Int
    The value of the rolled side on dice.

"""
function roll_dice!(dice::QuantumDice)
    rolledSide = rand(1:6) # get random side 

    pairIndex = div(rolledSide+2, 3) # get index of pair to alter

    # get opposite of rolled side 
    if pairIndex == 1
        oppIndex = 2
    else 
        oppIndex = 1
    end # if

    # use mod to get which pair was rolled 
    if (rolledSide % 3) == 0
        rolledValue = dice.pair1[pairIndex]
        dice.pair1 = (dice.pair1[pairIndex], dice.pair1[oppIndex]+1) # add one to oppIndex. This could flip pair, however this shouldn't matter
    
    elseif (rolledSide % 3) == 1 
        rolledValue = dice.pair2[pairIndex]
        dice.pair2 = (dice.pair2[pairIndex], dice.pair2[oppIndex]+1)
    
    else 
        rolledValue = dice.pair3[pairIndex]
        dice.pair3 = (dice.pair3[pairIndex], dice.pair3[oppIndex]+1)
    end # if

    rolledValue
end # function roll_dice!
