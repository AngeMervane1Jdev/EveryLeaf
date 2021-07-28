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
        fill_in 'search_title', with: 'Task1'
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
      it "You can search the priority with the scope method" do
        visit root_path
        select 'Low', from: 'search_priority'
        click_on 'search'
        expect(page).to have_content 'Task1'
      end
      it "Both title and status can be searched with the scope method" do
        visit root_path
        fill_in 'search_title', with: 'Task3'
        select 'completed', from: 'search_status'
        click_on 'search'
        expect(page).to have_content 'Task3'
      end
      it "Both title and priority can be searched with the scope method" do
        visit root_path
        fill_in 'search_title', with: 'Task3'
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
  describe 'Task registration screen' do
    before do
      @task1 = FactoryBot.create(:task1, title: 'task1')
      @task2 = FactoryBot.create(:task2, title: 'task2')
      @task3 = FactoryBot.create(:task3, title: 'task3')
      @labeling1 = FactoryBot.create(:labeling1)
      @labeling2 = FactoryBot.create(:labeling2)
    end
    context 'When you create a new task' do
      it 'Data is saved' do
        visit new_task_path
        fill_in 'title', with: 'new task'
        fill_in 'detail', with: 'new task detail'
        check 'label'
        click_on 'Modifier'
         expect(page).to have_content 'new task'
      end
    end
  end
  describe 'Task details screen' do
    before do
      @task = FactoryBot.create(:task, name: 'task')
      @labeling1 = FactoryBot.create(:labeling)
    end
     context 'When transitioning to any task details screen' do
       it 'Transit to the page where the content of the corresponding task is displayed' do
         visit task_path
         click_on 'detail'
         expect(page).to have_content 'task'
       end
     end
  end
end