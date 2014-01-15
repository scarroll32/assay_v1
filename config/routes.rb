Assay_v1::Application.routes.draw do

  resources :batches do
    resources :batch_details
  end
  
  resources :batches do
     collection { post :import }
  end
  
  resources :batch_details do
    resources :primer3_parameters
    resources :primer3_outputs
  end
    


  resources :primer3_settings
  resources :primer3_parameters


  #resources :data_sources
  #resources :primer3_batches

  #match '/cosmics/start_batch', :to => 'cosmics#start_batch', :as => 'start_batch'
  match '/batches/start_batch/:id', :to => 'batches#start_batch', :as => 'start_batch'
  match '/batches/apply_primer3_defaults/:id', :to => 'batches#apply_primer3_defaults', :as => 'apply_primer3_defaults'
  match '/batches/select_genes', :to => 'batches#select_genes', :as => 'select_genes'

  match 'wizards/start', :to => 'wizards#start', :as => 'start'
  match 'wizards/select', :to => 'wizards#select', :as => 'select'
  match 'wizards/export', :to => 'wizards#export', :as => 'export'
  match 'wizards/selected', :to => 'wizards#selected', :as => 'selected'
  match 'wizards/locate_btn', :to => 'wizards#locate_btn', :as => 'locate_btn'
  match 'wizards/locate/:id', :to => 'wizards#locate', :as => 'locate'
  match 'wizards/configure/:id', :to => 'wizards#configure', :as => 'configure'
  match 'wizards/primer3/:id', :to => 'wizards#primer3', :as => 'primer3'
  match 'wizards/primer3_btn/:id', :to => 'wizards#primer3_btn', :as => 'primer3_btn'
  #match 'wizards/primer3_btn', :to => 'wizards#primer3_btn', :as => 'primer3_btn'
  match 'wizards/assay/:id', :to => 'wizards#assay', :as => 'assay'
  match 'wizards/splinter', :to => 'wizard#splinter', :as => 'splinter'
  match 'wizards/import', to: 'wizards#import', as: 'import'

  match 'batch_state/:id', :to => 'wizards#batch_state', :as => 'batch_state'

  resources :wizards do
    collection do
      put :select_btn
      match 'search' => 'wizards#search', via: [:post, :get], as: :search
    end
  end

  # 


  #resources :batches do
  #  resources :batch_details
  #end

  #resources :batch_details do
    #resources :primer3_batches
  #  resources :primer3_parameters
  #end
  
  
  #resources :batches do
  #  resources :batch_details do
  #    resources :primer3_parameters
  #  end
  #end


  resources :cosmics do
    collection do
      put :select
    end
  end

  resources :home


  #resources :vogelsteins
  #resources :ampliseqs

  authenticated :user do
    root :to => "wizards#start"
  end

  root :to => "home#index"

  devise_for :users
  resources :users

  #authenticate :admin do
    #mount Resque::Server, :at => "/monitor"
  #end
  mount DjMon::Engine => 'monitor'

end
