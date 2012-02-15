module Saddler

  # Saddler is a single method module that makes finding saddle points easy.
  # Written by Emerson Lackey, a rubyist who still has much to learn.

  def Saddler.find(*arrays)
    # Assume we are given an array of arrays
    arrays = arrays[0]
    # Create an array to store our saddle points
    saddle_points = Array.new
    # Store the highest valued coordinates from each row in a hash
    high_value_coordinates = Hash.new
    # Each array is a single row
    arrays.each_with_index do |row, row_index|
      # Fetch the highest possible value in the current row
      highest_in_row = row.max
      # Loop through our row and store the highest values
      row.each_with_index do |row_value, column_index|
        if row_value === highest_in_row
          high_value_coordinates[[row_index, column_index]] = row_value
        end
      end
    end
    # Now that we have the highest values per row, we need to loop through each
    # column and remove elements that do not have the lowest value in their column
    row_count = arrays.count - 1
    high_value_coordinates.each_with_index do |coordinate, index|
      lowest_value = false
      column_index = coordinate.first[1]
      # Now we loop through each row and compare values from a single column.
      # We will keep track of our lowest values and remove any
      # 'high_value_coordinates' that are not the lowest value in their column
      (0..row_count).each do |row_index|
        column_value = arrays[row_index][column_index]
        if lowest_value === false
          lowest_value = column_value
        else
          if lowest_value > column_value
            lowest_value = column_value
          end
        end
      end
      # Now that we know the lowest value in the column, we just need to compare
      # them to our coordinate value and add them to our saddle_points hash
      if coordinate.last <= lowest_value
        saddle_points << {:x => coordinate[0][1], :y => coordinate[0][0]}
      end
    end
    return saddle_points
  end
end