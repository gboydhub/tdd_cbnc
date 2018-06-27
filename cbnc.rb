def match_check(ticket1, ticket2)
    unless ticket1.is_a?(String) && ticket2.is_a?(String)
        return false
    end
    ticket1 = ticket1.split('')
    ticket2 = ticket2.split('')
    matchcounter = 0
    ticket1.each_with_index do |num, index|
        unless num == ticket2[index]
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
    built_array = Array.new()
    winner_list.each do |ticket|
        match_list = check_list(ticket_list, ticket)
        converted_hash = {}
        match_list.each_with_index do |correct, index|
            converted_hash[index] = correct
        end

        built_array << converted_hash.sort_by { |index, matches| matches}
    end

    built_array
end

def print_results(winning_data, start=0, cutoff=200)
    winning_data.each_with_index do |tickset, winid|
        puts "\nData for winning ticket #{winid}"
        tickset.each do |tresult|
            if tresult[1] >= start && tresult[1] <= cutoff
                puts "Ticket ##{tresult[0]} is off by: #{tresult[1]}"
            end
        end
    end
end