require_relative 'todolist.rb'

# Creates a new todo list
list = TodoList.new("Buy Grocery")

# Add four new items
list.add_item("Milk","MEDIUM")
list.add_item("Sugar","LOW")
list.add_item("Tea","HIGH")
list.add_item("Coffee","HIGH")

# Print the list
list.print_list()
list.print_list("date") #sort by created
list.print_list("priority") #sort by priority

# Delete the first item
list.delete_item(1)

# Print the list
list.print_list()

# Delete the second item
list.delete_item(2)

# Print the list
list.print_list()

# Update the completion status of the first item to complete
list.toggle_status(1)

# Print the list
list.print_list()

# Update the title of the list
list.rename_list("Deepak's Grocery List")

# Print the list
list.print_list()

#save list object to file
list.save_to_file("my_list.yaml")

#initialize new object from saved file
new_list = TodoList.initialize_from_file("my_list.yaml")

#try printing the list
new_list.print_list("priority")
