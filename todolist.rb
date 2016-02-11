class TodoList
    attr_reader :title, :items
    # methods and stuff go here
    def initialize(list_title)
      @title = list_title
      @items = Array.new
    end

    def rename_list(new_name)
      @title = new_name
    end

    def add_item(new_item)
      item = Item.new(new_item)
      @items.push(item)
    end

    def delete_item(item_no)
      @items.delete_at(item_no-1)
    end

    def toggle_status(item_no)
      @items[item_no-1].toggle!
    end

    def print_list()
      puts "*"*10
      puts @title
      puts "*"*10

      sorted_array = @items.sort_by { |item| item.description }
      sorted_array.each_index { |index|  puts "#{index+1} #{@items[index].description} #{@items[index].completed?}"  }
    end
end

class Item
    attr_reader :description
    # methods and stuff go here
    def initialize(description)
      @description = description
      @completion_status = false
    end

    def toggle!
      @completion_status = !@completion_status
    end

    def completed?
      @completion_status
    end
end
