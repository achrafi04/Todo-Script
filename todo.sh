#!/bin/bash

# Created by: Achraf and Ilyas

TODO_FILE="todo.txt"

display_menu() {
    echo "Todo App Menu"
    echo "1. Create a new task"
    echo "2. Display all tasks"
    echo "3. Update an existing task"
    echo "4. Delete a task"
    echo "5. Mark a task as completed"
    echo "6. Show information about a task"
    echo "7. List tasks for a given day"
    echo "8. Search for a task by title"
    echo "9. Exit"
}

add_task() {
    echo "Enter Task Title (required):"
    read -r title
    if [ -z "$title" ]; then
        echo "Title cannot be empty"
        return 1
    fi

    echo "Enter Task Description:"
    read -r description

    echo "Enter Due Date (YYYY-MM-DD) (required):"
    read -r due_date
    if ! [[ $due_date =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        echo "Invalid date format. Please use YYYY-MM-DD"
        return 1
    fi

    echo "Is the task completed? (Y/N):"
    read -r completed
    if [[ "$completed" != "Y" && "$completed" != "N" ]]; then
        echo "Invalid input for completion status. Please enter Y or N"
        return 1
    fi

    id=$(wc -l < "$TODO_FILE")
    echo "$id|$title|$description|$due_date|$completed" >> "$TODO_FILE"
    echo "Task Added with ID $id"
}

display_tasks() {
    if [ -f "$TODO_FILE" ]; then
        echo "Tasks : "
        awk -F '|' '{print "ID:", $1; print "Title:", $2; print "Description:", $3; print "Due Date and Time:", $4; print "Completed:", $5; print "-------------------------------------------"}' "$TODO_FILE"
    else
        echo "No tasks found."
    fi
}

update_task() {
    echo "Updating a task..."

    echo -n "Enter the ID of the task you want to update: "
    read -r task_id

    task_info=$(grep "^$task_id|" "$TODO_FILE")
    if [ -n "$task_info" ]; then
        echo "Current Task Details:"
        echo "$task_info" | awk -F '|' '{print "ID:", $1; print "Title:", $2; print "Description:", $3; print "Due Date and Time:", $4; print "Completed:", $5; print "-------------------------------------------"}'

        echo "Select the field you want to update:"
        echo "1. Title"
        echo "2. Description"
        echo "3. Due Date"
        echo "4. Completion Status"
        read -r field_choice

        case "$field_choice" in
            '1') field="title" ;;
            '2') field="description" ;;
            '3') field="due_date" ;;
            '4') field="completed" ;;
            *) echo "Invalid option"
               return 1
               ;;
        esac

        echo "Enter new $field:"
        read -r new_value

        case "$field" in
            "title" | "description")
                ;;
            "due_date")
                if ! [[ $new_value =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
                    echo "Invalid date format. Please use YYYY-MM-DD"
                    return 1
                fi
                ;;
            "completed")
                if [[ "$new_value" != "Y" && "$new_value" != "N" ]]; then
                    echo "Invalid input for completion status. Please enter Y or N"
                    return 1
                fi
                ;;
        esac

        sed -i "/^$task_id|/c\\$task_id|$(echo "$task_info" | sed "s/[^|]*|/$new_value|/$(($field_choice + 1))")" "$TODO_FILE"
        echo "Task $task_id updated"
    else
        echo "Task with ID $task_id not found"
    fi
}

delete_task() {
    echo "Deleting a task..."
    echo -n "Enter the ID of the task you want to delete: "
    read -r task_id

    if grep -q "^$task_id|" "$TODO_FILE"; then
        sed -i "/^$task_id|/d" "$TODO_FILE"
        echo "Task with ID $task_id deleted successfully."
    else
        echo "Task with ID $task_id does not exist."
    fi
}

mark_task_completed() {
    echo "Marking a task as completed..."

    echo -n "Enter the ID of the task you want to mark as completed: "
    read -r task_id

    if grep -q "^$task_id|" "$TODO_FILE"; then
        sed -i "s/^$task_id|/ $task_id|Y |/" "$TODO_FILE"
        echo "Task marked as completed successfully."
    else
        echo "Task with ID $task_id does not exist."
    fi
}

show_task_info() {
    echo "Enter Task ID to show information:"
    read -r id
    if grep -q "^$id|" "$TODO_FILE"; then
        task_info=$(grep "^$id|" "$TODO_FILE")
        echo "Task Information:"
        echo "ID: $id"
        echo "Title: $(echo "$task_info" | cut -d '|' -f 2)"
        echo "Description: $(echo "$task_info" | cut -d '|' -f 3)"
        echo "Due Date: $(echo "$task_info" | cut -d '|' -f 4)"
        echo "Completed: $(echo "$task_info" | cut -d '|' -f 5)"
    else
        echo "Task with ID $id not found"
    fi
}

list_tasks_by_day() {
    echo "Enter Day (YYYY-MM-DD) to list tasks:"
    read -r day
    echo "Completed Tasks for $day:"
    grep "|$day " "$TODO_FILE" | grep "|Y$" | awk -F '|' '{print "ID:", $1; print "Title:", $2; print "Description:", $3; print "Due Time:", $4; print "-------------------------------------------"}'
    echo "Uncompleted Tasks for $day:"
    grep "|$day " "$TODO_FILE" | grep "|N$" | awk -F '|' '{print "ID:", $1; print "Title:", $2; print "Description:", $3; print "Due Time:", $4; print "-------------------------------------------"}'
}

search_task_by_title() {
    echo "Enter Title to search for:"
    read -r title
    grep -i "|$title|" "$TODO_FILE" | awk -F '|' '{print "ID:", $1; print "Title:", $2; print "Description:", $3; print "Due Time:", $4; print "Completed:", $5; print "-------------------------------------------"}'
}

main() {
    while true; do
        display_menu
        echo "Enter your choice (1-9): "
        read -r choice

        case $choice in
            1) add_task ;;
            2) display_tasks ;;
            3) update_task ;;
            4) delete_task ;;
            5) mark_task_completed ;;
            6) show_task_info ;;
            7) list_tasks_by_day ;;
            8) search_task_by_title ;;
            9) echo "Exiting..." && exit 0 ;;
            *) echo "Invalid choice. Please enter a number from 1 to 9." ;;
        esac
    done
}

main