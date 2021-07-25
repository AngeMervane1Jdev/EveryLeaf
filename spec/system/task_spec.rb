require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
    before do
        # Créez à l'avance deux tâches à utiliser dans le undefined de la liste des tâches
        @task=FactoryBot.create(:task1)
        @tasks=FactoryBot.create(:task2)
        @tasks=FactoryBot.create(:task3)
    end


  describe 'New creation function' do
    context 'When creating a new task' do
      it 'The created task is displayed' do
        # タスク一覧ページに遷移
        visit tasks_path
        # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
        # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
        expect(page).to have_content 'Title'
    end
    end
    context 'When searching with the scope method' do
      it "You can search for titles with the scope method" do
        visit root_path
        fill_in 'search_word', with: 'Task1'
        click_on 'search'
        # expect(Task.get_by_taskname('task').count).to eq 1
        expect(page).to have_content 'Task1'
      end
      it "You can search the status with the scope method" do
        visit root_path
        select 'progress', from: 'search_status'
        click_on 'search'
        expect(page).to have_content 'Task2'
      end
      it "Priority search is possible with the scope method" do
        visit root_path
        select 'Low', from: 'search_priority'
        click_on 'search'
        expect(page).to have_content 'Task1'
      end
      it "Both title and status can be searched with the scope method" do
        visit root_path
        fill_in 'search_word', with: 'Task3'
        select 'completed', from: 'search_status'
        click_on 'search'
        expect(page).to have_content 'Task3'
      end
      it "Both title and priority can be searched with the scope method" do
        visit root_path
        fill_in 'search_word', with: 'Task3'
        select 'High', from: 'search_priority'
        click_on 'search'
        sleep 1
        expect(page).to have_content 'Task3'
      end
      it "Both status and priority can be searched with the scope method" do
        visit root_path
        select 'unstarted', from: 'search_status'
        sleep 1
        select 'Low', from: 'search_priority'
        click_on 'search'
        # binding.irb
        expect(page).to have_content 'Task1'
      end
    end
  end
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
           
      end
    end
    # テスト内容を追加で記載する
      context 'When the tasks are arranged in descending order of creation date and time' do
        it 'The new task is displayed at the top' do
          visit tasks_path
          task_list = all('.task_row') 
          expect(task_list[0]).to have_content 'Task3'
          expect(task_list[1]).to have_content 'Task2'
          expect(task_list[2]).to have_content 'Task1'
        end
      end
  end
  describe 'Detailed display function' do
     context 'When transitioned to any task details screen' do
       it 'The content of the relevant task is displayed' do

       end
     end
  end
end