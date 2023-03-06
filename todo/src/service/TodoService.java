package service;

import beans.Todo;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class TodoService {
    private static List<Todo> todos = new ArrayList<>();


    static {
        todos.add(new Todo("Learn JSP", "BE"));
        todos.add(new Todo("Learn Spring", "BE"));
        todos.add(new Todo("Learn Spring MVC", "BE"));
    }

    public List<Todo> getTodos() {
        return todos;
    }

    public void addTodo(String todo, String category) {
        todos.add(new Todo(todo , category));
    }

    public void deleteTodo(String name, String category) {
        todos.removeIf(todo -> (todo.getName().equals(name)&&todo.getCategory().equals(category)));
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
