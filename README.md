# Todo App

## Overview

This Todo App is a simple task management program written in Bash. It allows you to create, update, delete, mark, and search tasks using a text-based menu interface.

## Design Choices

### Data Storage
- **File**: The tasks are stored in a plain text file called `todo.txt`.
- **Format**: Each task is stored on a single line in the format: `id|title|description|due_date|completed`.
  - `id`: Integer representing the task ID.
  - `title`: Short description of the task.
  - `description`: Detailed description of the task.
  - `due_date`: Date by which the task should be completed, formatted as `YYYY-MM-DD`.
  - `completed`: Either `Y` (yes) or `N` (no), indicating whether the task is completed.

### Code Organization
The script is divided into several functions, each responsible for a specific task management operation:

- `display_menu()`: Displays the main menu options.
- `add_task()`: Adds a new task.
- `display_tasks()`: Displays all tasks.
- `update_task()`: Updates an existing task.
- `delete_task()`: Deletes a task.
- `mark_task_completed()`: Marks a task as completed.
- `show_task_info()`: Displays detailed information about a specific task.
- `list_tasks_by_day()`: Lists tasks for a specific day.
- `search_task_by_title()`: Searches for tasks by title.

The `main()` function is the entry point of the script and runs an infinite loop to display the menu and execute the corresponding function based on the user's choice.

## Running the Program

### 1. Save the Script
Copy the script into a file, for example, `todo.sh`. Make sure to include the `#!/bin/bash` shebang at the top of the file.

### 2. Make the Script Executable
Open a terminal and navigate to the directory where you saved `todo.sh`. Run the following command to make the script executable:

```bash
chmod +x todo.sh
```

### 3. Run the Script
In the terminal, run the script by typing:

```bash
./todo.sh
```

### 4. Using the Menu
You will see a menu with options to create, update, delete, and manage tasks. Enter the number corresponding to the operation you want to perform (e.g., `1` to create a new task).

## Explanation of Operations

### 1. Add Task
- Prompts the user for the task title, description, due date, and completion status.
- Validates the title and due date.
- Generates a new task ID based on the number of lines in `todo.txt`.
- Appends the new task to `todo.txt`.

### 2. Display Tasks
- Checks if `todo.txt` exists.
- Uses `awk` to format and print each task stored in `todo.txt`.

### 3. Update Task
- Prompts the user for the task ID to update.
- If the task exists, displays the current task details.
- Allows the user to select which field to update (title, description, due date, or completion status).
- Validates the new input and updates the task using `sed`.

### 4. Delete Task
- Prompts the user for the task ID to delete.
- If the task exists, deletes the line corresponding to the task ID using `sed`.

### 5. Mark Task Completed
- Prompts the user for the task ID to mark as completed.
- If the task exists, updates the completion status to `Y` using `sed`.

### 6. Show Task Info
- Prompts the user for the task ID to show.
- If the task exists, displays the task details using `grep` and `cut`.

### 7. List Tasks by Day
- Prompts the user for a specific date.
- Displays completed and uncompleted tasks for the specified date using `grep` and `awk`.

### 8. Search Task by Title
- Prompts the user for a title to search.
- Displays tasks with titles matching the search term using `grep` and `awk`.

## Example Usage

### Add a Task
- Select option `1` from the menu.
- Enter the task title, description, due date, and completion status.
- The task is added to `todo.txt` and assigned a unique ID.

### Display All Tasks
- Select option `2` from the menu.
- All tasks are listed with their details.

### Update a Task
- Select option `3` from the menu.
- Enter the ID of the task you want to update.
- Select the field to update and provide the new value.
- The task is updated in `todo.txt`.

### Delete a Task
- Select option `4` from the menu.
- Enter the ID of the task you want to delete.
- The task is removed from `todo.txt`.

## Credits

This script was developed by Achraf Ikisse and Ilyas Himit.
