class Image
  def initialize(array)
    @image = array
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def get_ones
    ones = []
    @image.each_with_index do |img_array, img_array_index|
      img_array.each_with_index do |img_array_item, img_array_item_index|
        if img_array_item == 1
          ones  << [img_array_index, img_array_item_index]
        end
      end
    end
    ones
  end

  def blur
    ones = get_ones
    @image.each_with_index do |img_array, img_array_index|
      img_array.each_with_index do |img_array_item, img_array_item_index|
        ones.each do |x_row_num, y_col_num|
          
          if img_array_index == x_row_num && img_array_item_index == y_col_num
            @image[img_array_index -1][img_array_item_index] = 1 unless img_array_index == 0
            @image[img_array_index +1][img_array_item_index] = 1 unless img_array_index >= 3
            @image[img_array_index][img_array_item_index -1] = 1 unless img_array_item_index == 0
            @image[img_array_index][img_array_item_index +1] = 1 unless img_array_item_index >= 3
           end
        end
      end
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.blur
image.output_image
