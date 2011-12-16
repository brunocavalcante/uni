Uni::Application.routes.draw do
  root :to => 'home#index'
  resources :search do
    collection do
      post :all
    end
  end
  
  namespace :admin do
    root :to => 'home#index'
    resources :home
    resources :scholarities
    resources :course_categories
    resources :courses do
        resources :disciplines do 
          new do
            get :search
          end
          member do
            get :versions
          end
        end
        resources :curriculums do 
          resources :curriculum_disciplines
          resources :curriculum_modules
        end
        resources :curriculum_students do 
          resources :transferred_disciplines
        end
    end
    resources :professors
    resources :students
    resources :academic_periods do
      resources :lectures do 
        resources :lecture_students
      end
    end
    resources :parameters do 
      collection do
        post :update, :as => :update
      end  
    end
    resources :reports
    resources :contracts
  end
  
  resources :user do 
    collection do
      get :edit
      post :update
    end
  end
  
  namespace :professor do
    root :to => 'home#index'
    resources :lectures do
      member do 
        get 'tests-and-abscences', :action => :tests_and_abscences, :as => 'tests_and_abscences'
        get :details
      end
      resources :lecture_students
      resources :wall
      resources :files do 
        member do
          get :download
        end
      end
      resources :lessons do 
        resources :absences
      end
      resources :lecture_absences
      resources :tests do 
        resources :test_results
      end
    end
  end
  
  namespace :student do
    root :to => 'home#index'
    namespace :reports do 
      root :to => 'home#index'
      
      resources :home
      resources :transcripts
      resources :schedule
      resources :tests_and_absences
    end
    resources :lectures do
      member do 
        get 'tests-and-absences', :action => :tests_and_absences, :as => 'tests_and_absences'
        get :details
      end
      resources :lecture_students
      resources :wall
      resources :lessons
      resources :files do
        member do
          get :download
        end
      end
    end
  end
  
  resources :password_recovery
  resources :about
  resources :disciplines
  resources :professors
  
  match 'login', :to => 'auth#login', :as => "login"
  match 'login/auth', :to => 'auth#authenticate', :as => "authenticate"
  match 'profile', :to => 'auth#profile', :as => "profile"
  match 'logout', :to => 'auth#logout', :as => "logout"
  match 'admin/courses/:course_id/disciplinas/new/search/:id', :to => 'admin/disciplinas#add'
end
