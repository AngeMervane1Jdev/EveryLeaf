require 'rails_helper'
RSpec.describe 'Label test',type: :system do
    describe 'While testing Label functions' do
        before do
          @user=FactoryBot.create(:user,name: 'test',email: 'test@gmail.com',password: '8888888')
          @task1 = FactoryBot.create(:task1)
          @task2 = FactoryBot.create(:task2)
          @task3 = FactoryBot.create(:task3)
          label=Label.create(name:'A',user_id:nil)
          visit new_session_path
          fill_in 'session[email]', with: 'test@gmail.com'
          fill_in 'session[password]', with: '8888888'
          click_button 'signin'
        end
        context 'Create new task' do
          it 'Labels are displayed' do
            visit new_session_path
            expect(page).to have_content 'A'
          end
          it 'create new task and add tag' do 
          visit new_task_path
          fill_in 'task[title]', with: 'new task'
          fill_in 'task[detail]', with: 'new task detail'
          check 'A'
          click_on 'Creer'
          expect(page).to have_content 'new task'
          end
          it 'You can search by label' do
            visit new_task_path
            fill_in 'task[title]', with: 'new task'
            fill_in 'task[detail]', with: 'new task detail'
            check 'A'
            click_on 'Creer'
            visit tasks_path
            select 'A',from: 'search_label'
            click_on 'search'
            expect(page).to have_content 'new task'
          end
        end
      end
end