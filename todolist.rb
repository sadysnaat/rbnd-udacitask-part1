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

    def add_item(new_item,priority)
      item = Item.new(new_item,priority)
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

      sorted_array = @items
      sorted_array.sort! { |a,b| a.description <=> b.description }

      sorted_array.each_index { |index|  puts "#{index+1} #{@items[index].description} #{@items[index].completed?} #{@items[index].priority}"  }

      puts "\n"*2
    end
end

class Item
    attr_reader :description, :priority
    # methods and stuff go here
    @@priorities = {LOW: 3,MEDIUM: 2, HIGH: 1}
    def initialize(description,priority)
      @description = description
      @completion_status = false
      @created_on = Time.new
      @priority = @@priorities[priority.to_sym]
    end

    def toggle!
      @completion_status = !@completion_status
    end

    def completed?
      @completion_status
    end
end
