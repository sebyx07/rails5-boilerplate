# frozen_string_literal: true

# == Route Map
#
#                                                Prefix Verb   URI Pattern                                                                                           Controller#Action
#                                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                            active_storage/blobs#show
#                             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)              active_storage/representations#show
#                                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                           active_storage/disk#show
#                             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                                   active_storage/disk#update
#                                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                        active_storage/direct_uploads#create
#                                           admin_users GET    /admin/users(.:format)                                                                                admin/users#index
#                                                       POST   /admin/users(.:format)                                                                                admin/users#create
#                                        new_admin_user GET    /admin/users/new(.:format)                                                                            admin/users#new
#                                       edit_admin_user GET    /admin/users/:id/edit(.:format)                                                                       admin/users#edit
#                                            admin_user GET    /admin/users/:id(.:format)                                                                            admin/users#show
#                                                       PATCH  /admin/users/:id(.:format)                                                                            admin/users#update
#                                                       PUT    /admin/users/:id(.:format)                                                                            admin/users#update
#                                                       DELETE /admin/users/:id(.:format)                                                                            admin/users#destroy
#                                            admin_root GET    /admin(.:format)                                                                                      admin/users#index
#                                           sidekiq_web        /admin/sidekiq                                                                                        Sidekiq::Web
#                                       comfy_admin_cms GET    /admin/blog(.:format)                                                                                 comfy/admin/cms/base#jump
#                    reorder_comfy_admin_cms_site_pages PUT    /admin/blog/sites/:site_id/pages/reorder(.:format)                                                    comfy/admin/cms/pages#reorder
#              form_fragments_comfy_admin_cms_site_page GET    /admin/blog/sites/:site_id/pages/:id/form_fragments(.:format)                                         comfy/admin/cms/pages#form_fragments
#             revert_comfy_admin_cms_site_page_revision PATCH  /admin/blog/sites/:site_id/pages/:page_id/revisions/:id/revert(.:format)                              comfy/admin/cms/revisions/page#revert
#                   comfy_admin_cms_site_page_revisions GET    /admin/blog/sites/:site_id/pages/:page_id/revisions(.:format)                                         comfy/admin/cms/revisions/page#index
#                    comfy_admin_cms_site_page_revision GET    /admin/blog/sites/:site_id/pages/:page_id/revisions/:id(.:format)                                     comfy/admin/cms/revisions/page#show
#               toggle_branch_comfy_admin_cms_site_page GET    /admin/blog/sites/:site_id/pages/:id/toggle_branch(.:format)                                          comfy/admin/cms/pages#toggle_branch
#  form_fragments_comfy_admin_cms_site_page_translation GET    /admin/blog/sites/:site_id/pages/:page_id/translations/:id/form_fragments(.:format)                   comfy/admin/cms/translations#form_fragments
# revert_comfy_admin_cms_site_page_translation_revision PATCH  /admin/blog/sites/:site_id/pages/:page_id/translations/:translation_id/revisions/:id/revert(.:format) comfy/admin/cms/revisions/translation#revert
#       comfy_admin_cms_site_page_translation_revisions GET    /admin/blog/sites/:site_id/pages/:page_id/translations/:translation_id/revisions(.:format)            comfy/admin/cms/revisions/translation#index
#        comfy_admin_cms_site_page_translation_revision GET    /admin/blog/sites/:site_id/pages/:page_id/translations/:translation_id/revisions/:id(.:format)        comfy/admin/cms/revisions/translation#show
#                comfy_admin_cms_site_page_translations POST   /admin/blog/sites/:site_id/pages/:page_id/translations(.:format)                                      comfy/admin/cms/translations#create
#             new_comfy_admin_cms_site_page_translation GET    /admin/blog/sites/:site_id/pages/:page_id/translations/new(.:format)                                  comfy/admin/cms/translations#new
#            edit_comfy_admin_cms_site_page_translation GET    /admin/blog/sites/:site_id/pages/:page_id/translations/:id/edit(.:format)                             comfy/admin/cms/translations#edit
#                 comfy_admin_cms_site_page_translation GET    /admin/blog/sites/:site_id/pages/:page_id/translations/:id(.:format)                                  comfy/admin/cms/translations#show
#                                                       PATCH  /admin/blog/sites/:site_id/pages/:page_id/translations/:id(.:format)                                  comfy/admin/cms/translations#update
#                                                       PUT    /admin/blog/sites/:site_id/pages/:page_id/translations/:id(.:format)                                  comfy/admin/cms/translations#update
#                                                       DELETE /admin/blog/sites/:site_id/pages/:page_id/translations/:id(.:format)                                  comfy/admin/cms/translations#destroy
#                            comfy_admin_cms_site_pages GET    /admin/blog/sites/:site_id/pages(.:format)                                                            comfy/admin/cms/pages#index
#                                                       POST   /admin/blog/sites/:site_id/pages(.:format)                                                            comfy/admin/cms/pages#create
#                         new_comfy_admin_cms_site_page GET    /admin/blog/sites/:site_id/pages/new(.:format)                                                        comfy/admin/cms/pages#new
#                        edit_comfy_admin_cms_site_page GET    /admin/blog/sites/:site_id/pages/:id/edit(.:format)                                                   comfy/admin/cms/pages#edit
#                             comfy_admin_cms_site_page PATCH  /admin/blog/sites/:site_id/pages/:id(.:format)                                                        comfy/admin/cms/pages#update
#                                                       PUT    /admin/blog/sites/:site_id/pages/:id(.:format)                                                        comfy/admin/cms/pages#update
#                                                       DELETE /admin/blog/sites/:site_id/pages/:id(.:format)                                                        comfy/admin/cms/pages#destroy
#                    reorder_comfy_admin_cms_site_files PUT    /admin/blog/sites/:site_id/files/reorder(.:format)                                                    comfy/admin/cms/files#reorder
#                            comfy_admin_cms_site_files GET    /admin/blog/sites/:site_id/files(.:format)                                                            comfy/admin/cms/files#index
#                                                       POST   /admin/blog/sites/:site_id/files(.:format)                                                            comfy/admin/cms/files#create
#                         new_comfy_admin_cms_site_file GET    /admin/blog/sites/:site_id/files/new(.:format)                                                        comfy/admin/cms/files#new
#                        edit_comfy_admin_cms_site_file GET    /admin/blog/sites/:site_id/files/:id/edit(.:format)                                                   comfy/admin/cms/files#edit
#                             comfy_admin_cms_site_file PATCH  /admin/blog/sites/:site_id/files/:id(.:format)                                                        comfy/admin/cms/files#update
#                                                       PUT    /admin/blog/sites/:site_id/files/:id(.:format)                                                        comfy/admin/cms/files#update
#                                                       DELETE /admin/blog/sites/:site_id/files/:id(.:format)                                                        comfy/admin/cms/files#destroy
#                  reorder_comfy_admin_cms_site_layouts PUT    /admin/blog/sites/:site_id/layouts/reorder(.:format)                                                  comfy/admin/cms/layouts#reorder
#           revert_comfy_admin_cms_site_layout_revision PATCH  /admin/blog/sites/:site_id/layouts/:layout_id/revisions/:id/revert(.:format)                          comfy/admin/cms/revisions/layout#revert
#                 comfy_admin_cms_site_layout_revisions GET    /admin/blog/sites/:site_id/layouts/:layout_id/revisions(.:format)                                     comfy/admin/cms/revisions/layout#index
#                  comfy_admin_cms_site_layout_revision GET    /admin/blog/sites/:site_id/layouts/:layout_id/revisions/:id(.:format)                                 comfy/admin/cms/revisions/layout#show
#                          comfy_admin_cms_site_layouts GET    /admin/blog/sites/:site_id/layouts(.:format)                                                          comfy/admin/cms/layouts#index
#                                                       POST   /admin/blog/sites/:site_id/layouts(.:format)                                                          comfy/admin/cms/layouts#create
#                       new_comfy_admin_cms_site_layout GET    /admin/blog/sites/:site_id/layouts/new(.:format)                                                      comfy/admin/cms/layouts#new
#                      edit_comfy_admin_cms_site_layout GET    /admin/blog/sites/:site_id/layouts/:id/edit(.:format)                                                 comfy/admin/cms/layouts#edit
#                           comfy_admin_cms_site_layout PATCH  /admin/blog/sites/:site_id/layouts/:id(.:format)                                                      comfy/admin/cms/layouts#update
#                                                       PUT    /admin/blog/sites/:site_id/layouts/:id(.:format)                                                      comfy/admin/cms/layouts#update
#                                                       DELETE /admin/blog/sites/:site_id/layouts/:id(.:format)                                                      comfy/admin/cms/layouts#destroy
#                 reorder_comfy_admin_cms_site_snippets PUT    /admin/blog/sites/:site_id/snippets/reorder(.:format)                                                 comfy/admin/cms/snippets#reorder
#          revert_comfy_admin_cms_site_snippet_revision PATCH  /admin/blog/sites/:site_id/snippets/:snippet_id/revisions/:id/revert(.:format)                        comfy/admin/cms/revisions/snippet#revert
#                comfy_admin_cms_site_snippet_revisions GET    /admin/blog/sites/:site_id/snippets/:snippet_id/revisions(.:format)                                   comfy/admin/cms/revisions/snippet#index
#                 comfy_admin_cms_site_snippet_revision GET    /admin/blog/sites/:site_id/snippets/:snippet_id/revisions/:id(.:format)                               comfy/admin/cms/revisions/snippet#show
#                         comfy_admin_cms_site_snippets GET    /admin/blog/sites/:site_id/snippets(.:format)                                                         comfy/admin/cms/snippets#index
#                                                       POST   /admin/blog/sites/:site_id/snippets(.:format)                                                         comfy/admin/cms/snippets#create
#                      new_comfy_admin_cms_site_snippet GET    /admin/blog/sites/:site_id/snippets/new(.:format)                                                     comfy/admin/cms/snippets#new
#                     edit_comfy_admin_cms_site_snippet GET    /admin/blog/sites/:site_id/snippets/:id/edit(.:format)                                                comfy/admin/cms/snippets#edit
#                          comfy_admin_cms_site_snippet PATCH  /admin/blog/sites/:site_id/snippets/:id(.:format)                                                     comfy/admin/cms/snippets#update
#                                                       PUT    /admin/blog/sites/:site_id/snippets/:id(.:format)                                                     comfy/admin/cms/snippets#update
#                                                       DELETE /admin/blog/sites/:site_id/snippets/:id(.:format)                                                     comfy/admin/cms/snippets#destroy
#                       comfy_admin_cms_site_categories GET    /admin/blog/sites/:site_id/categories(.:format)                                                       comfy/admin/cms/categories#index
#                                                       POST   /admin/blog/sites/:site_id/categories(.:format)                                                       comfy/admin/cms/categories#create
#                     new_comfy_admin_cms_site_category GET    /admin/blog/sites/:site_id/categories/new(.:format)                                                   comfy/admin/cms/categories#new
#                    edit_comfy_admin_cms_site_category GET    /admin/blog/sites/:site_id/categories/:id/edit(.:format)                                              comfy/admin/cms/categories#edit
#                         comfy_admin_cms_site_category PATCH  /admin/blog/sites/:site_id/categories/:id(.:format)                                                   comfy/admin/cms/categories#update
#                                                       PUT    /admin/blog/sites/:site_id/categories/:id(.:format)                                                   comfy/admin/cms/categories#update
#                                                       DELETE /admin/blog/sites/:site_id/categories/:id(.:format)                                                   comfy/admin/cms/categories#destroy
#                                 comfy_admin_cms_sites GET    /admin/blog/sites(.:format)                                                                           comfy/admin/cms/sites#index
#                                                       POST   /admin/blog/sites(.:format)                                                                           comfy/admin/cms/sites#create
#                              new_comfy_admin_cms_site GET    /admin/blog/sites/new(.:format)                                                                       comfy/admin/cms/sites#new
#                             edit_comfy_admin_cms_site GET    /admin/blog/sites/:id/edit(.:format)                                                                  comfy/admin/cms/sites#edit
#                                  comfy_admin_cms_site PATCH  /admin/blog/sites/:id(.:format)                                                                       comfy/admin/cms/sites#update
#                                                       PUT    /admin/blog/sites/:id(.:format)                                                                       comfy/admin/cms/sites#update
#                                                       DELETE /admin/blog/sites/:id(.:format)                                                                       comfy/admin/cms/sites#destroy
#                                  comfy_cms_render_css GET    /blog/cms-css/:site_id/:identifier(/:cache_buster)(.:format)                                          comfy/cms/assets#render_css
#                                   comfy_cms_render_js GET    /blog/cms-js/:site_id/:identifier(/:cache_buster)(.:format)                                           comfy/cms/assets#render_js
#                                 comfy_cms_render_page GET    /blog(/*cms_path)(.:format)                                                                           comfy/cms/content#show
#                                                  root GET    /                                                                                                     static#landing
#                                        authentication GET    /authentication(.:format)                                                                             authentication#login
#                                                       POST   /authentication(.:format)                                                                             authentication#login_post
#                                                       DELETE /authentication(.:format)                                                                             authentication#logout_delete
#                               authentication_register GET    /authentication/register(.:format)                                                                    authentication#register
#                                                       POST   /authentication/register(.:format)                                                                    authentication#register_post
#                                               account GET    /account(.:format)                                                                                    account#index
#                                                       POST   /account(.:format)                                                                                    account#update
#                               account_update_password POST   /account/update_password(.:format)                                                                    account#update_password

require "sidekiq/web"

Rails.application.routes.draw do
  is_admin = -> (request) { User.find_by(id: request.session[:user_id])&.admin? }

  namespace :admin, constraints: is_admin, path: 'admin/administrate' do
    resources :users
    root to: "users#index"
  end

  mount Sidekiq::Web => "/admin/sidekiq", constraints: is_admin

  # check initializers/comfortable_mexican_sofa.rb
  comfy_route :cms_admin, path: "/admin/blog"
  comfy_route :cms, path: "/blog"

  mount LetterOpenerWeb::Engine, at: "/dev/emails" if Rails.env.development?

  root "static#landing"

  namespace :authentication do
    get "", action: :login
    post "", action: :login_post
    delete "", action: :logout_delete

    get "/register", action: :register, as: :register
    post "/register", action: :register_post

    get "/activate/:code", action: :activate, as: :activate

    get "/reset_password/:code", action: :reset_password, as: :reset_password
    post "/reset_password/:code", action: :reset_password_post

  end

  namespace :account do
    get "", action: :index
    post "", action: :update
    post "update_password", action: :update_password, as: :update_password
  end
end
