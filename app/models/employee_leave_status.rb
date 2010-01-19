class EmployeeLeaveStatus < ActiveRecord::Base
  belongs_to :employee
  cattr_reader :per_page      

  named_scope :order_by_employee, :order => 'employee_id' 
end
