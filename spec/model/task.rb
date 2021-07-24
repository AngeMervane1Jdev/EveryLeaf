require 'rails_helper'
RSpec.describe 'Task management function', type: :model do
    it 'If the title is empty, validation will not pass' do
        task = Task.new(title: '', detail: 'deatisl blabla')
       expect(task).not_to be_valid
    end
    it 'If the content is empty, validation will not pass' do
        task = Task.new(title: 'somme thing', detail: '')
        expect(task).not_to be_valid
      end 
    it 'If the task content and details are described validation will pass' do
        task = Task.new(title: 'this is', detail: 'very good.')
        expect(task).to be_valid
    end
end