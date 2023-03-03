package servlet;

import beans.Todo;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class TodoService {
    private static List<Todo> todos = new ArrayList<>();


    static {
        todos.add(new Todo("Learn JSP"));
        todos.add(new Todo("Learn Spring"));
        todos.add(new Todo("Learn Spring MVC"));
    }

    public List<Todo> getTodos() {
        return todos;
    }

    public void addTodo(String todo) {
        todos.add(new Todo(todo));
    }

    public void deleteTodo(String name) {
        todos.removeIf(todo -> todo.getName().equals(name));
    }

    public boolean sameTodo(String name) {
//        for (Todo todo : todos) {
//            if(todo.getName().equals(name)){
//                return true;
//            }
//        }
//        return false;

        return todos.stream().anyMatch(todo -> todo.getName().equals(name));

    }



}
