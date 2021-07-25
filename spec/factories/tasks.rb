FactoryBot.define do
    factory :task1 ,class: Task do
      # Veuillez modifier le contenu suivant en fonction du nom de colonne réellement créé
      title { 'Task1' }
      detail { 'test_detail' }
      deadline {DateTime.now }
      status { 0 }
      priority { 0 }
    end
    factory :task2, class: Task do
        title { 'Task2' }
        detail {'Default '}
        deadline {DateTime.now +1}
        status { 1 }
        priority { 2 }
    end
    factory :task3, class: Task do
      title { 'Task3' }
      detail {'Default '}
      deadline {DateTime.now +2}
      status { 2 }
      priority { 2 }
     end

  end