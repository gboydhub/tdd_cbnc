def match_check(ticket1, ticket2)
    unless ticket1.is_a?(String) && ticket2.is_a?(String)
        return 0
    end
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

def check_list(ticket_list, ticket_winner)
    ticket_matches = Array.new()
    ticket_list.each do |num|
        ticket_matches << match_check(num, ticket_winner)
    end

    ticket_matches
end

def get_total_winners(ticket_list, winner_list)
    [{0 => 1}]
end