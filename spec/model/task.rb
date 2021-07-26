require 'rails_helper'
RSpec.describe 'Task management function', type: :model do
    it 'If the title is empty, validation will not pass' do
        task = Task.new(title: '', detail: 'deatisl blabla',deadline: DateTime.now )
       expect(task).not_to be_valid
    end
    it 'If the content is empty, validation will not pass' do
        task = Task.new(title: 'somme thing', detail: '',deadline:DateTime.now+1)
        expect(task).not_to be_valid
      end 
    it 'If the task content and details are described validation will pass' do
        task = Task.new(title: 'this is', detail: 'very good.', deadline: DateTime.now+2)
        expect(task).to be_valid
    end
    describe 'You can search with the scope method' do
      before do
        @task1 = FactoryBot.create(:task1, title: 'task1',detail: 'something', deadline:DateTime.now,status:0,priority:1)
        @task2 = FactoryBot.create(:task2, title: 'task2',detail: 'something1', deadline:DateTime.now,status:1,priority:0)
        @task3 = FactoryBot.create(:task3, title: 'task3',detail: 'something2', deadline:DateTime.now,status:2,priority:1)
      end
      it 'You can search for titles' do
        expect(Task.search_sort('task1')).to include(@task1)
      end
      it 'You can search the status' do
        expect(Task.status_sort(1)).to include(@task2)
      end
      it 'You can search the priority' do
        expect(Task.priority_sort(1)).to include(@task3)
      end
      it 'You can search for both title and status' do
        expect(Task.search_sort('task3').status_sort(2)).to include(@task3)
      end
    end
end