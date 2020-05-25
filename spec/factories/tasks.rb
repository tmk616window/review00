FactoryBot.define do
  factory :task do
    design_point {1}
    function_point {2}
    plam_point {1}
    unique_point {3}
    user_perspective_point {2}
    recruit {"新卒"}
    field {"バックエンドエンジニア"}
    task_pl {"Ruby"}
    task_tool {"github"}
    github_url {"tmk616/git.com"}
    company_info {"自社開発"}
    task_coment {"よろしくお願いします"} 
    study_period {6}
    user
    
    trait :invalid do
      task_pl {"abc"}
    end
  end
end
