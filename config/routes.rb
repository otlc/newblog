Rails.application.routes.draw do
# Add default routes for posts
 resources :posts
# Also add posts as the index for our application. Add the posts controller index action as the default/root for our application landing page.
 root "posts#index"
end
