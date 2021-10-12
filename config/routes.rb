Rails.application.routes.draw do
  use_doorkeeper
  puts
  resources :account do
    post 'account/login'
    post 'account/validate_token'
    resources :boards do
      resources :standards do
        resources :subjects do 
          resources :lesso do
            resources :video
            resources :pdfs
            resources :exercise do
              resources :question do
                resources :answer 
                resources :student_solution
              end
            end
          end
        end
      end
    end
  end
end
