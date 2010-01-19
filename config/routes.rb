ActionController::Routing::Routes.draw do |map|
    map.resources :leaves, :as => :leave_management,
                  :member => {:print => :get, :accept => :post, :reject => :post, :edit_emp_leave_status => :get, :update_emp_leave_status => :post, :change_year => :post},
                  :collection =>{ :policy => :post, :emp_leave_status => :any, :new_emp_leave_status => :get, :create_emp_leave_status => :post}
end
