# Question/Challenge: Build a Diamond Machine


# You are a skilled diamondsmith whose business is getting better by the day. Eventually, you decided that you needed to scale to keep up with demand.

# Build a diamond-cutting machine (i.e. write a function that takes in a positive integer representing the raw stone's carat).
# The output would be the finished diamond and tag indicating its quality, arranged in an array of two elements.
# The first element would be an array of arrays representing the diamond.
# The second element would be a string indicating "perfect cut" if all the diamond's edges are pointy or "good cut" otherwise.

# Examples
# diamond(3) -> [
#   [[0, 1, 0],
#   [1, 0, 1],
#   [0, 1, 0]],
#   "perfect cut"
# ]

# Perfect edge.


# diamond(4) --> [
#   [[0, 1, 1, 0],
#   [1, 0, 0, 1],
#   [0, 1, 1, 0]],
#   "good cut"
# ]

# First and last rows had blunt edges with two 1s each.

# diamond(11) --> [
#   [[0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
#   [0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0],
#   [0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0],
#   [0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0],
#   [0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0],
#   [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
#   [0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0],
#   [0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0],
#   [0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0],
#   [0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0],
#   [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0]],
#   "perfect cut"
# ]





def perfect_cut(carat)
    diamond = Array.new(carat) { Array.new(carat, 0) }
    mid = carat / 2
    for row in 0..carat/2 do
        diamond[row][mid - row] = 1
        diamond[row][mid + row] = 1
        diamond[carat - 1 - row][mid - row] = 1
        diamond[carat - 1 - row][mid + row] = 1
    end
    return [diamond, 'perfect cut']
end

def good_cut(carat)
    diamond = Array.new(carat-1) { Array.new(carat, 0) }
    mid = carat / 2
    for row in 0..carat/2-1 do
        diamond[row][mid - row - 1] = 1
        diamond[row][mid + row] = 1
        diamond[carat - 2 - row][mid - row - 1] = 1
        diamond[carat - 2 - row][mid + row] = 1
    end
    return [diamond, 'good cut']
end

def diamond(carat)
	if carat % 2 == 0 then
		return good_cut(carat)
	else
		return perfect_cut(carat)
	end
end