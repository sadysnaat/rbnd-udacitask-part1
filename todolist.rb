class TodoList

    attr_reader :title, :items
    # methods and stuff go here
    def initialize(list_title)
      @title = list_title
      @items = Array.new
    end

    def add_item(new_item)
      item = Item.new(new_item)
      @items.push(item)
    end
end

class Item
    # methods and stuff go here
    def initialize(description)
      @description = description
      @completion_status = false
    end
end
