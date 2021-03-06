# By default Volt generates this controller for your Main component
module Main
  class MainController < Volt::ModelController
    model :store

    def index
      # Add code for when the index view is loaded
    end

    def about
      # Add code for when the about view is loaded
    end

    def create_todo
      unless page._new_todo.empty?
        _todos << { title: page._new_todo, completed: false }
        page._new_todo = ''
      end  
    end

    def toggle_todo(todo)
      todo._completed = !todo._completed
    end

    def todo_complete(todo)
      todo._completed ? "completed" : nil 
    end

    def remove_todo(todo)
      _todos.remove({ title: todo._title })  
    end

    def todos
      if _todos
        _todos.all
      end
    end

    private

    # The main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._component, params._controller, and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end

    # Determine if the current nav component is the active one by looking
    # at the first part of the url against the href attribute.
    def active_tab?
      url.path.split('/')[1] == attrs.href.split('/')[1]
    end
  end
end
