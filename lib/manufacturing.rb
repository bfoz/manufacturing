module Manufacturing
    # Given a set of linear stock, and a set of desired lengths, figure out
    #  where to make the cuts
    # @example
    #  cut_stock1D( stock: [150.cm, 150.cm],
    #               parts: [{length:23.cm, quantity:4},
    #                       {length:28.cm, quantity:4},
    #                       {length:33.cm, quantity:4}],
    #               kerf: 3.mm)
    # @option stock [Array]	The available stock pieces
    # @option parts [Array<Hash>]	The desired lengths, and quantities of each length, to be cut
    # @option kerf  [Number]	The blade kerf
    # @return [Array<Hash>]     The list of cut locations for each stock piece
    def self.cut_stock1D(stock:{}, parts:{}, kerf:nil)
    	exploded_parts = parts.flat_map {|h| [h[:length]] * h[:quantity]}.sort
	cutlist = stock.map {|length| {cuts:[], length:length, remainder:length} }
	remainders = cutlist.map {|cl| cl[:remainder] }

	while !exploded_parts.empty?
	    length = exploded_parts.pop

	    # Find a remainder that's big enough
	    i = remainders.find_index {|r| r >= length }
	    raise StandardError, "Oh no! Nothing left when placing #{length}: #{cutlist}" unless i

	    # Found one!
	    cl = cutlist[i]

	    # Add to the cut list
	    cl[:cuts] << length
	    # Reduce the remainder
	    cl[:remainder] -= length
	    # Account for the blade width
	    cl[:remainder] -= kerf if kerf && cl[:remainder] >= kerf

	    remainders = cutlist.map {|cl| cl[:remainder] }
	end

	cutlist 
    end
end
