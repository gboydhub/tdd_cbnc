def match_check(ticket1, ticket2)
    ticket1 = ticket1.split('')
    ticket2 = ticket2.split('')
    matchcounter = 0
    ticket1.each_with_index do |num, index|
        if num == ticket2[index]
            matchcounter += 1
        end
    end

    matchcounter
end