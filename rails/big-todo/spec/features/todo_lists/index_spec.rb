require 'spec_helper'

feature "TodoList" do
  context "index" do
    before do
      @l1 = TodoList.create(name: 'Homeworks and Labs')
      @l2 = TodoList.create(name: 'Weekend Plans')

      visit todo_lists_path
    end

    it "should display the todo list names linked to their pages" do
      expect(page).to have_link(@l1.name, href: todo_list_path(@l1))
      expect(page).to have_link(@l2.name, href: todo_list_path(@l2))
    end

    it "should have a form for creating new todo lists" do
      todo_list_name = 'New York City bucket list'

      fill_in(:todo_list_name, with: todo_list_name)
      click_button('Create Todo list')

      expect(page).to have_content(todo_list_name)
    end
  end
end
