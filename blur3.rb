class Image

  attr_accessor :array

  def initialize(array)       # Method to init new Image object
    @array = array
  end

  def output_image            # Method to output coordinates
    array.each do |row|       # Iterate over each array inside the master array
      row.each do |coord|     # Iterate over each element inside each sub-array
        print coord           # Print the individual value of the item in the sub-array
      end
    puts "\n"                 # Line break in between rows
    end
  end

  def blur_image(md)
    copy = []                                 # Create empty secondary array
    array.each do |row|                       # Iterate over each array inside the master array
      copy << row.clone                       # Create clone of each sub-array inside secondary array for current step reference
    end

    md_counter = 0                            # Init counter to compare against Manhattan Distance var

    while md_counter < md do                    # Run while counter is less than Manhattan Distance var
      array.each_with_index do |row, x|         # Iterate over each array inside the master array
        row.each_with_index do |coord, y|       # Iterate over each element inside each sub-array
          if copy[x][y] == 1                    # Check current step copy if coord == 0 or == 1
            array[x+1][y] = 1 unless x+1 > array.count-1      # Set adjacent coord to 1
            array[x-1][y] = 1 unless x-1 < 0                  # Set adjacent coord to 1
            array[x][y+1] = 1 unless y+1 > array[0].count-1   # Set adjacent coord to 1
            array[x][y-1] = 1 unless y-1 < 0                  # Set adjacent coord to 1
          end
        end                 
      end
      copy = []                                 # Re-set current step copy to blank array
      array.each do |row|                       # Iterate over each array inside the master array
        copy << row.clone                       # Create clone of each sub-array inside secondary array for current step reference
      end
      md_counter += 1                           # Increment counter to compare against Manhattan Distance var
    end
    return output_image
  end

end

image = Image.new([           # Create & assign new Image object
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0]
])

image.blur_image(3)