#!/bin/bash

TODO_FILE="$HOME/todo.txt"

view_tasks() {
    echo "Your Tasks:"
    nl "$TODO_FILE"
}

add_task() {
    echo "Enter a new task:"
    read task

    echo "$task" >> "$TODO_FILE"

    echo "Task added successfully!"
}

delete_task() {
    echo "Current Tasks:"
    nl "$TODO_FILE"

    echo "Enter task number to delete:"
    read task_number

    sed -i "${task_number}d" "$TODO_FILE"

    echo "Task deleted successfully!"
}

while true
do
    echo ""
    echo "===== TO-DO LIST MENU ====="
    echo "1. View all tasks"
    echo "2. Add a new task"
    echo "3. Delete a task"
    echo "4. Exit"

    echo ""
    echo "Choose an option:"
    read choice

    case $choice in
        1)
            view_tasks
            ;;
        2)
            add_task
            ;;
        3)
            delete_task
            ;;
        4)
            echo "Goodbye!"
            break
            ;;
        *)
            echo "Invalid option!"
            ;;
    esac
done
