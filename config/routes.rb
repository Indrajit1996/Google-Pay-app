Rails.application.routes.draw do
  apipie
	namespace :api do
  		namespace :v1 do
  			resources :users do
  				resources :bank_accounts  do
  					resources :transactions ,only: [:index , :show]
  					end
				end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
			resources :transactions, only: [:create] do 
				resources :scratchcards
			end
		end
	end
end
