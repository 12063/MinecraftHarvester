
--to do:
    --test
    --document
    --fill out both Google docs

--Code by Josh, please enjoy responsibility :P

--first is variables
answersArray = {}
thingsToBeAsked = { "name" , "pumpkin", "dirt", "hay", " " , " " , " " ,"red sand", "soul sand" }
amountOfThingsCollected = { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
stepsTakenVariable = 0
lengthOfWallVariable = 0
howDeepVariable = 0
goToFloorVariable = false
usersNameVariable = " "
--the code below is functions

function goToWall() --this function means that I can easily go forward till something is infront
    while turtle.detect() == false do
        turtle.forward()
    end
end

function goToFloor() -- this function means that I can easily go downwards till it is on the floor
    while turtle.detectDown() == false do
        turtle.down()
    end
end


function moveOverLeft()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnRight()
    stepsTakenVariable = stepsTakenVariable + 1
--this will move one block right, as well as counting how many times it has done this.
end


function detectItemsThenDigPumpkin() --this function detects if the block in fron is pumpkin, and digs it if we don't have enough
a = 2
    turtle.select(a) --selects the second block
    howDeepVariable = 0 --sets a variable to 0
    if turtle.compare() == true then --if the block in front is the same as the second block then:
        while  amountOfThingsCollected[a] < tonumber(answersArray[a]) do --if we have less than we need:
            if turtle.detect() == true then --if there is something in front:
                if turtle.dig() == true then --if the block can be dug then: dig it,
                    amountOfThingsCollected[a] = amountOfThingsCollected[a] + 1 -- and counts how many times this happens
                    turtle.up() --and moves up
                else --otherwise
                    for a = 1 , 3 do --do the following three times
                        turtle.back() --come back three times
                        howDeepVariable = 0 --set this variable to 0
                    end
                    moveOverLeft() --when done move left
                end
            else
                goToFloor() --go to the floor
                turtle.forward() --move forward
                howDeepVariable = howDeepVariable + 1 --add one to this counter
            end
        end
        goToFloor() --go to the floor
        for a = 1 , howDeepVariable do --move back the amout of times that was moved forward
                turtle.back()
            end
        howDeepVariable = 0 --set this variable to 0
    end
end

function detectItemsThenDigDirt() --the same thinking for above
a = 3
    turtle.select(a) 
    howDeepVariable = 0 
    if turtle.compare() == true then 
        while  amountOfThingsCollected[a] < tonumber(answersArray[a]) do 
            if turtle.detect() == true then 
                if turtle.dig() == true then 
                    amountOfThingsCollected[a] = amountOfThingsCollected[a] + 1 
                    turtle.up() 
                else 
                    for a = 1 , 3 do 
                        turtle.back() 
                        howDeepVariable = 0 
                    end
                    moveOverLeft()
                end
            else
                goToFloor()
                turtle.forward()
                howDeepVariable = howDeepVariable + 1
            end
        end
        goToFloor()
        for a = 1 , howDeepVariable do
                turtle.back()
            end
        howDeepVariable = 0
    end
end

function detectItemsThenDigHay() --the same thinking for above
a = 4
    turtle.select(a)
    howDeepVariable = 0
    if turtle.compare() == true then
        while  amountOfThingsCollected[a] < tonumber(answersArray[a]) do
            if turtle.detect() == true then
                if turtle.dig() == true then
                    amountOfThingsCollected[a] = amountOfThingsCollected[a] + 1
                    turtle.up()
                else
                    for a = 1 , 3 do
                        turtle.back()
                        howDeepVariable = 0
                    end
                    moveOverLeft()
                end
            else
                goToFloor()
                turtle.forward()
                howDeepVariable = howDeepVariable + 1
            end
        end
        goToFloor()
        for a = 1 , howDeepVariable do
                turtle.back()
            end
        howDeepVariable = 0
    end
end

function detectItemsThenDigRedSand() ----the same thinking for above, EXCEPT it does not move up. This is because the sand drops after something above it is dug.
a = 8
    turtle.select(a)
    howDeepVariable = 0
    if turtle.compare() == true then
        while  amountOfThingsCollected[a] < tonumber(answersArray[a]) do
            if turtle.detect() == true then
                if turtle.dig() == true then
                    amountOfThingsCollected[a] = amountOfThingsCollected[a] + 1
                else
                    for a = 1 , 3 do
                        turtle.back()
                        howDeepVariable = 0
                    end
                    moveOverLeft()
                end
            else
                goToFloor()
                turtle.forward()
                howDeepVariable = howDeepVariable + 1
            end
        end
        goToFloor()
        for a = 1 , howDeepVariable do
                turtle.back()
            end
        howDeepVariable = 0
    end
end

function detectItemsThenDigSoulSand() --the same thinking as all the others
a = 9
    turtle.select(a)
    howDeepVariable = 0
    if turtle.compare() == true then
        while  amountOfThingsCollected[a] < tonumber(answersArray[a]) do
            if turtle.detect() == true then
                if turtle.dig() == true then
                    amountOfThingsCollected[a] = amountOfThingsCollected[a] + 1
                    turtle.up()
                else
                    for a = 1 , 3 do
                        turtle.back()
                        howDeepVariable = 0
                    end
                    moveOverLeft()
                end
            else
                goToFloor()
                turtle.forward()
                howDeepVariable = howDeepVariable + 1
            end
        end
        goToFloor()
        for a = 1 , howDeepVariable do
                turtle.back()
            end
        howDeepVariable = 0
    end
end

--next is code

--asks for a name then stores it in an variable
print("What is your " .. thingsToBeAsked[1] .. " ?") --asks for a name.
usersNameVariable = io.read() --stores the users responce in a variable

--asks for amount of pumpkin and stores it in an array
--then it checks if the answer is a number.
--if it is a number then it see if the number is too large

function askForAmountPumpkin() --this function askes for a name. It has to be number and it has to bes less than 60
a = 2
    isNumberVariablePumpkin = false --sets the variable to false
    isValidAmountVariablePumpkin = false --sets another variable to false
    while isNumberVariablePumpkin == false and isValidAmountVariablePumpkin == false do --while the two variables are false do the following:
    print("How many of " .. thingsToBeAsked[a] .. " do you want? Enter a NUMBER less than 60") --askes the user how many pumpkin they want
    answersArray[a] = io.read() -- sets the users imput to an variable that is stored in an array
        if not tonumber(answersArray[a]) then --if the answer if not a number then:
        print("Has to be a number sorry, Please try again") --tells the user that it has to be a number
        else --otherwise
            isNumberVariablePumpkin = true --sets a variable to true
            if tonumber(answersArray[a]) < 60 then --if the users answer is greater than 60 then:
                isValidAmountVariablePumpkin = true --sets the variable to true
            else --otherwise
            print("Too large of a number, try less than 64") --tells the user to enter a smaller number
            isNumberVariablePumpkin = false --and sets 2 variables o false 
            isValidAmountVariablePumpkin = false
            end
        end
    end
end
askForAmountPumpkin() --then calls this function

function askForAmountDirt() --same as above
a = 3
    isNumberVariableDirt = false
    isValidAmountVariableDirt = false
    while isNumberVariableDirt == false and isValidAmountVariableDirt == false do
    print("How many of " .. thingsToBeAsked[a] .. " do you want? Enter a NUMBER less than 60")
    answersArray[a] = io.read()
        if not tonumber(answersArray[a]) then
        print("Has to be a number sorry, Please try again")
        else
            isNumberVariableDirt = true
            if tonumber(answersArray[a]) < 60 then
                isValidAmountVariableDirt = true
            else
            print("Too large of a number, try less than 64")
            isNumberVariableDirt = false
            isValidAmountVariableDirt = false
            end
        end
    end
end
askForAmountDirt()

function askForAmountHay() --same as the function above
a = 4
    isNumberVariableHay = false
    isValidAmountVariableHay = false
    while isNumberVariableHay == false and isValidAmountVariableHay == false do
    print("How many of " .. thingsToBeAsked[a] .. " do you want? Enter a NUMBER less than 60")
    answersArray[a] = io.read()
        if not tonumber(answersArray[a]) then
        print("Has to be a number sorry, Please try again")
        else
            isNumberVariableHay = true
            if tonumber(answersArray[a]) < 60 then
                isValidAmountVariableHay = true
            else
            print("Too large of a number, try less than 64")
            isNumberVariableHay = false
            isValidAmountVariableHay = false
            end
        end
    end
end
askForAmountHay()

function askForAmountRedSand() --same as the function above
a = 8
    isNumberVariableRedSand = false
    isValidAmountVariableRedSand = false
    while isNumberVariableRedSand == false and isValidAmountVariableRedSand == false do
    print("How many of " .. thingsToBeAsked[a] .. " do you want? Enter a NUMBER less than 60")
    answersArray[a] = io.read()
        if not tonumber(answersArray[a]) then
        print("Has to be a number sorry, Please try again")
        else
            isNumberVariableRedSand = true
            if tonumber(answersArray[a]) < 60 then
                isValidAmountVariableRedSand = true
            else
            print("Too large of a number, try less than 64")
            isNumberVariableRedSand = false
            isValidAmountVariableRedSand = false
            end
        end
    end
end
askForAmountRedSand()

function askForAmountSoulSand() --same as the function above
a = 9
    isNumberVariableSoulSand = false
    isValidAmountVariableSoulSand = false
    while isNumberVariableSoulSand == false and isValidAmountVariableSoulSand == false do
    print("How many of " .. thingsToBeAsked[a] .. " do you want? Enter a NUMBER less than 60")
    answersArray[a] = io.read()
        if not tonumber(answersArray[a]) then
        print("Has to be a number sorry, Please try again")
        else
            isNumberVariableSoulSand = true
            if tonumber(answersArray[a]) < 60 then
                isValidAmountVariableSoulSand = true
            else
            print("Too large of a number, try less than 64")
            isNumberVariableSoulSand = false
            isValidAmountVariableSoulSand = false
            end
        end
    end
end
askForAmountSoulSand()

--this code takes it out of it's starting block and put's it in position
turtle.forward()
turtle.turnRight()
turtle.forward()

function countLength() --this function counts how many blocks long a wall is. It works left-to-right.
    turtle.turnLeft() --turns left
    while turtle.detect() == false do --while nothing is in front
        turtle.forward() --goes forward
        lengthOfWallVariable = lengthOfWallVariable + 1 --adds one to a variable
        end
    turtle.turnRight() --turn right
end

function countLengthAndReturn() --this function counts how many blocks long a wall is. It works left-to-right. THEN it returns to it's first block.
    countLength() -- calls the function that we made above
    turtle.turnRight() --then turns right
    for a = 1 , lengthOfWallVariable do --does the following, for how long the wall is
        turtle.forward() --goes forward
    end
    turtle.turnLeft() --turn left
end

--now we are ready to being, since the turtle is facing the first block
--the turtle will face the most right block, then work it's way left. After that it will (try) to return to it's first block
--let's count the wall before we begin.
countLengthAndReturn()

--Done. lengthOfWallVariable now equals the length of the wall. The turtle is back in it's first block
--now we need to start digging the items we need.
--if there is a block infront and not on the left then the turtle will do the following:

for a = 1 , lengthOfWallVariable do --does the following for the length of the wall.
    --the following code checks if the block on the wall is the same as the one as the inventory, if it is then it digs it, IF it is less than the amount needed. It does this for all the types of blocks needed.
    detectItemsThenDigPumpkin() --calls the function that digs pumpkin
    detectItemsThenDigDirt() --calls the function that digs dirt
    detectItemsThenDigHay() --calls the function that digs hay
    detectItemsThenDigRedSand() --calls the function that digs red sand
    detectItemsThenDigSoulSand() --calls the function that digs soul sand
    moveOverLeft()
end

turtle.turnRight() --turns right
for a = 1 , stepsTakenVariable do --do this once for every step taken.
    turtle.forward() --go forward
end --now the turtle is back where it started, the futherest most right block

turtle.turnRight() --this code below returns it to where the user started the program
turtle.forward()    
turtle.turnLeft()
turtle.forward()
--the turtle is back in it's very first place
turtle.turnRight()
turtle.turnRight()
--the turtle is facing the way it was when it was first started



--Now we will tell the user how many things we got of each.
print( "Yo " .. usersNameVariable .. " I found the following: " ) 
print( " " .. amountOfThingsCollected[2] .. " of " .. thingsToBeAsked[2] .. " " )
print( " " .. amountOfThingsCollected[3] .. " of " .. thingsToBeAsked[3] .. " " )
print( " " .. amountOfThingsCollected[4] .. " of " .. thingsToBeAsked[4] .. " " )
print( " " .. amountOfThingsCollected[8] .. " of " .. thingsToBeAsked[8] .. " " )
print( " " .. amountOfThingsCollected[9] .. " of " .. thingsToBeAsked[9] .. " " )

--end of code

