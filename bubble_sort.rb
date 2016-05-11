def bubble_sort(numbers)
	#Checks if the user only entered one number
	if numbers.is_a? Integer || numbers.length = 1
		return numbers
	end

	counter = 0


	loop do
		
		(numbers.length - 1).times do |i|
			if numbers[i] >= numbers[i + 1]
				numbers[i], numbers[i + 1] = numbers[i+1], numbers[i]
			end
		end
		counter += 1

		break if counter >= numbers.length - 1
	end

	return numbers
end


def bubble_sort_by(numbers)
#Checks if the user only entered one number
	if numbers.is_a? Integer || numbers.length = 1
		return numbers
	end

	counter = 0


	loop do
		
		(numbers.length - 1).times do |i|
			if yield(numbers[i], numbers[i + 1]) > 0
				numbers[i], numbers[i + 1] = numbers[i+1], numbers[i]
			end
		end
		counter += 1

		break if counter >= numbers.length - 1
	end

	return numbers
end

puts bubble_sort(3)
puts bubble_sort([4,3,78,2,0,2])

puts bubble_sort_by(["hi", "hello", "hey"]) { |left, right| left.length - right.length }
puts bubble_sort_by(["hi", "hello", "hey"]) { |left, right| right.length - left.length }
