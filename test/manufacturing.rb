require 'minitest/autorun'
require 'manufacturing'

describe Manufacturing do
    it 'must cut 1D stock when all of the pieces fit' do
	Manufacturing.cut_stock1D(stock: [175, 150],
				  parts: [{length:20, quantity:4},
					  {length:25, quantity:4},
					  {length:30, quantity:4}],
				  kerf: 1).must_equal [
				      {cuts:[30, 30, 30, 30, 25, 25], length:175, remainder:0},
				      {cuts:[25, 25, 20, 20, 20, 20], length:150, remainder:14},
				  ]
    end
end
