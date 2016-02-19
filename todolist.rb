require "yaml"

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

    def print_list(sort="description")
      #Basic formatiing
      puts "*"*@title.length
      puts @title
      puts "*"*@title.length

      #print header
      puts "\nNo.\tItem\tStatus\tPriority\tDate Created"

      #sort on basis of parameter
      sorted_array = @items
      case sort
      when "description"
        sorted_array.sort! { |a,b| a.description <=> b.description }
      when "date"
        sorted_array.sort! { |a,b| (a.created_on == b.created_on) ? a.description <=> b.description : a.created_on <=> b.created_on }
      when "priority"
        sorted_array.sort! { |a,b| (a.priority == b.priority) ? a.description <=> b.description : a.priority <=> b.priority }
      end

      sorted_array.each_index do |index|
        status = @items[index].completed? ? "\u{2611}" : "\u{2610}" #☐ for incomplete and  ☑ for completed items
        puts "#{index+1}\t#{@items[index].description}\t#{status}\t#{@items[index].priority}\t\t#{@items[index].created_on.strftime("%Y/%m/%d")}".encode("utf-8")
      end

      puts "\n"*2
    end

    def save_to_file(file_name)
      File.open(file_name,'w') { |file_handler| file_handler.write(YAML.dump(self)) }
    end

    def self.initialize_from_file(file_name)
      YAML.load_file(file_name)
    end
end

class Item
    attr_reader :description, :priority, :created_on
    # methods and stuff go here
    @@priorities = {LOW: 3,MEDIUM: 2, HIGH: 1}
    #Learnt new thing class variables
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
