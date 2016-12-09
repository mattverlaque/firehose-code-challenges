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

end

image = Image.new([           # Create & assign new Image object
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image