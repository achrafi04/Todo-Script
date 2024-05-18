# Simple Task Manager

## What's This?

Hey there! This is a basic task manager that we've built using Bash. It's pretty straightforward and lets you add, update, delete, mark, and search tasks. All of this is done through a user-friendly text menu.

## How We Built It

### Storing Tasks
- **Where?**: We keep all the tasks in a simple text file named `todo.txt`.
- **How?**: Each task gets its own line in the file, and we store it like this: `id|title|description|due_date|completed`.
  - `id`: A number for the task.
  - `title`: A brief summary of the task.
  - `description`: More details about the task.
  - `due_date`: When the task needs to be done by, in `YYYY-MM-DD` format.
  - `completed`: This is either `Y` (yes) or `N` (no), depending on whether the task is done.

### Organizing the Code
We've split the script into several functions, each one handling a different part of managing tasks:

- `display_menu()`: Shows the main menu.
- `add_task()`: Lets you add a new task.
- `display_tasks()`: Shows all the tasks.
- `update_task()`: Lets you change a task.
- `delete_task()`: Removes a task.
- `mark_task_completed()`: Marks a task as done.
- `show_task_info()`: Gives more info about a task.
- `list_tasks_by_day()`: Shows tasks for a certain day.
- `search_task_by_title()`: Finds tasks by their title.

The `main()` function is where everything starts. It keeps showing the menu and running the right function based on what you choose.

## How to Use It

### 1. Save the Script
First, copy the script into a file. You could name it `todo.sh`, for example. Don't forget to put `#!/bin/bash` at the top of the file.

### 2. Make the Script Executable
Open up a terminal and go to the directory where `todo.sh` is. Then, run this command to make the script executable:

```bash
chmod +x todo.sh
```

### 3. Run the Script
In the terminal, you can run the script like this:

```bash
./todo.sh
```

### 4. Use the Menu
You'll see a menu with options for creating, updating, deleting, and managing tasks. Just type the number for what you want to do (like `1` to create a new task).

## What Each Operation Does

### 1. Add Task
- Asks you for the task title, description, due date, and whether it's completed.
- Checks the title and due date to make sure they're okay.
- Makes a new task ID based on how many lines are in `todo.txt`.
- Adds the new task to `todo.txt`.

### 2. Display Tasks
- Checks if `todo.txt` is there.
- Uses `awk` to format and show each task in `todo.txt`.

### 3. Update Task
- Asks you for the task ID to update.
- If the task is there, it shows the current task details.
- Lets you pick which field to update (title, description, due date, or whether it's completed).
- Checks the new input and updates the task using `sed`.

### 4. Delete Task
- Asks you for the task ID to delete.
- If the task is there, it removes the line for the task ID using `sed`.

### 5. Mark Task Completed
- Asks you for the task ID to mark as completed.
- If the task is there, it changes the completion status to `Y` using `sed`.

### 6. Show Task Info
- Asks you for the task ID to show.
- If the task is there, it shows the task details using `grep` and `cut`.

### 7. List Tasks by Day
- Asks you for a specific date.
- Shows tasks that are done and not done for that date using `grep` and `awk`.

### 8. Search Task by Title
- Asks you for a title to search for.
- Shows tasks with titles that match what you searched for using `grep` and `awk`.

## Example Usage

### Add a Task
- Pick `1` from the menu.
- Type in the task title, description, due date, and whether it's completed.
- The task gets added to `todo.txt` and gets a unique ID.

### Display All Tasks
- Pick `2` from the menu.
- All the tasks get listed with their details.

### Update a Task
- Pick `3` from the menu.
- Type in the ID of the task you want to update.
- Pick the field to update and type in the new value.
- The task gets updated in `todo.txt`.

### Delete a Task
- Pick `4` from the menu.
- Type in the ID of the task you want to delete.
- The task gets removed from `todo.txt`.

## Who Made This?

This script was made by Achraf Ikisse and Ilyas Himit. We're both university students who love coding and learning new things. We hope you find this script useful! 😊
