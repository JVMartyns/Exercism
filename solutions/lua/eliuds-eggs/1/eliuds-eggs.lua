local EliudsEggs = {}

function EliudsEggs.egg_count(number)
    local eggs = 0
    repeat 
      eggs = eggs + number % 2
      number = number // 2
    until number < 1
    return eggs
end

return EliudsEggs
