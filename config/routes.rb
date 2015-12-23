Rails.application.routes.draw do
# Add default routes for posts
 resources :posts do
 	# add nested resources
 	resources :comments
 end
# Also add posts as the index for our application. Add the posts controller index action as the default/root for our application landing page.
 root "posts#index"

# The following creates a reference link /about so we don't need to type /pages/about.
 get '/about', to: 'pages#about'

end
