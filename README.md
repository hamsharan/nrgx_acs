# nrgx_acs
Account Control System

Ruby (ruby-2.6.5) and Rails (rails (6.0.1)) and psql (PostgreSQL) 12.1

#bundle exec rake db:crate
- getting the database created

#bundle install

#Tests
- bundle exec rspec 

#Api::v1- ROUTES
- bundle exec rake routes
- 
                                root GET    /                                                                                        site#index
                                
                       api_v1_persons GET    /api/v1/persons(.:format)                                                                api/v1/persons#index
                       
                                      POST   /api/v1/persons(.:format)                                                                api/v1/persons#create
                                      
                        api_v1_person PATCH  /api/v1/persons/:id(.:format)                                                            api/v1/persons#update
                        
                                      PUT    /api/v1/persons/:id(.:format)                                                            api/v1/persons#update
                                      
                                      DELETE /api/v1/persons/:id(.:format)                                                            api/v1/persons#destroy
                                      
                      api_v1_accounts GET    /api/v1/accounts(.:format)                                                               api/v1/accounts#index
                      
                                      POST   /api/v1/accounts(.:format)                                                               api/v1/accounts#create
                                      
                       api_v1_account PATCH  /api/v1/accounts/:id(.:format)                                                           api/v1/accounts#update
                       
                                      PUT    /api/v1/accounts/:id(.:format)                                                           api/v1/accounts#update
                                      
                                      DELETE /api/v1/accounts/:id(.:format)                                                           api/v1/accounts#destroy

