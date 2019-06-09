Class Image
    attr_accessor :data

    def Initialize(data)
        @data = data
    end

    def blur

        cell_array =[]
        @data.each_with_index do |row, row_index|
            row.each_with_index do |column, column_index|
                if column == 1
                    cell_array.push([row_index, column_index]).join(",")
                end
            end
        end
    
        cell_array.each do |index|
            # Blurring all lines upward
            @data [index.first-1][index.last] = 1 if index.first > 0
    
            # Blurring all lines downward
            @data [index.first+1][index.last] = 1 if index.first < @data.length - 1
    
            # Blurring all lines right
            @data [index.first][index.last+1] = 1 if index.last < @data.first.length - 1
    
            # Blurring all lines to the left
            @data [index.first][index.last-1] = 1 if index.last > 0
    
        end
           
        return Image.new(@data)
    end
end
