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

  def blur(distance)
    ones = get_ones
    @image.each_with_index do |img_array, img_array_index|
      img_array.each_with_index do |img_array_item, img_array_item_index|
        ones.each do |x_row_num, y_col_num|
          
          if manhattan_distance(img_array_item_index, img_array_index, y_col_num, x_row_num) <= distance
            @image[img_array_index][img_array_item_index] = 1
          end
        end
      end
    end
  end

  def manhattan_distance(x1, y1, x2, y2)
    horizontal_distance = (x2 - x1).abs
    vertical_distance = (y2 - y1).abs
    horizontal_distance + vertical_distance
  end
end

image = Image.new([
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 1, 0, 0, 0, 0]
])

image.blur(3)
image.output_image
