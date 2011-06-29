Uni::Application.routes.draw do
  root :to => 'home#index'
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
        end
        resources :curriculums do 
          resources :curriculum_disciplines, :as => 'disciplines'
        end
        resources :course_students, :as => 'students', :only => [:index]
    end
    resources :professors
    resources :students
    resources :academic_periods
    resources :parameters do 
      collection do
        post :update, :as => :update
      end  
    end
    resources :reports
  end
  
  resources :user do 
    collection do
      get :edit
      post :update
    end
  end
  
  namespace :professor do
    root :to => 'home#index'
  end
  
  namespace :student do
    root :to => 'home#index'
    resources :reports do
      collection do
        get 'tests-and-abscences', :action => :tests_and_abscences, :as => 'tests_and_abscences'
        get :transcripts, :timetable
      end
    end
    resources :classes
  end
  
  resources :password_recovery
  resources :about
  
  match 'login', :to => 'auth#login', :as => "login"
  match 'login/auth', :to => 'auth#authenticate', :as => "authenticate"
  match 'profile', :to => 'auth#profile', :as => "profile"
  match 'logout', :to => 'auth#logout', :as => "logout"
  match 'admin/courses/:course_id/disciplinas/new/search/:id', :to => 'admin/disciplinas#add'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
