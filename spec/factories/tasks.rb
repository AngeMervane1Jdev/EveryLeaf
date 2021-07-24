FactoryBot.define do
    factory :task1 ,class: Task do
      # Veuillez modifier le contenu suivant en fonction du nom de colonne réellement créé
      title { 'Task1' }
      detail { 'test_detail' }
    end
    factory :task2, class: Task do
        title { 'Task2' }
        detail {'Default '}
    end
    factory :task3, class: Task do
      title { 'Task3' }
      detail {'Default '}
     end

  end