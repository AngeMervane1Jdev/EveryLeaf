FactoryBot.define do
    factory :task do
      # Veuillez modifier le contenu suivant en fonction du nom de colonne réellement créé
      title { 'test_title' }
      detail { 'test_content' }
    end
    factory :second_task, class: Task do
        title { 'Title 2 créé par l\'usine' }
        detail {'Default content 2 made by Factory'}
    end

  end