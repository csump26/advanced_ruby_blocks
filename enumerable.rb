module Enumerable 

	# A similar method of the each method
	def my_each
		if block_given?
			0.upto(self.length - 1) do |i|
				yield(self.to_a[i])
			end
			self
		end
	end

	# A similar method of the each_with_index
	def my_each_with_index
		if block_given?
			0.upto(self.length - 1) do |i|
				yield(self.to_a[i], i)
			end
			self
		end
	end

	# A similar method of the select method
	def my_select
		if block_given?
			selected = []
			0.upto(self.length - 1) do |i|
				if yield(self[i])
					selected << self[i] 
				end
			end
			selected
		end
	end

	# A similar method of the all method
	def my_all?
		if block_given?
			my_each {|i| return false unless yield(i)}
		else
			my_each {|i| return false unless i}
		end
		true
	end

	# A similar method of the any method
	def my_any?
		if block_given?
			my_each {|i| return true if yield(i)}
		else
			my_each {|i| return true if i}
		end
		false
	end

	# A similar method of the none method
	def my_none?
		if block_given?
			my_each {|i| return false if yield(i)}
		else
			my_each {|i| return false if i}
		end
		true
	end

	# A similar method of the count method
	def my_count(item=nil)
		counter = 0 
		if !item.nil?
			my_each {|i| counter += 1 if i == item}
		elsif block_given?
			my_each {|i| counter += 1 if yield(i)}
		else
			counter = length
		end

		counter
	end

	# A similar method of the map method
	def my_map
		result = []
		if block_given?
			my_each {|i| result << yield(i)}
			result
		else
			self
		end

	end

	# A similar method of the inject method
	def my_inject(initial=nil)
		initial = self[0] if initial.nil?
		memo = initial
		my_each {|i| memo = yield(memo, i)}
		memo
	end

end

def multiply_els(array)
	array.my_inject(1) { |product, element| product * element }
end

puts multiply_els([2,4,5])

