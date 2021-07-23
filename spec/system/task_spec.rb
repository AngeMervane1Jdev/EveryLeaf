require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
    before do
        # Créez à l'avance deux tâches à utiliser dans le undefined de la liste des tâches
        FactoryBot.create(:task)
        FactoryBot.create(:second_task)
    end
  describe 'New creation function' do
    context 'When creating a new task' do
      it 'The created task is displayed' do
        task = FactoryBot.create(:task, title: 'task')
        # タスク一覧ページに遷移
        visit tasks_path
        # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
        # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
        expect(task).to be_valid  
    end
    end
  end
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
           
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