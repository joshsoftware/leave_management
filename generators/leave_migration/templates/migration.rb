class CreateLeaveManagement < ActiveRecord::Migration
  create_table "leaves", :force => true do |t|
    t.column "employee_id",         :integer,                 :null => false
    t.column "date",                :date,                    :null => false
    t.column "start_date_of_leave", :date,                    :null => false
    t.column "end_date_of_leave",   :date,                    :null => false
    t.column "no_of_days",          :integer,                 :null => false
    t.column "reason_of_leave",     :string
    t.column "contact_no",          :string
    t.column "address",             :text
    t.column "status",              :string,  :default => "", :null => false
    t.column "type_of_leave",       :string
  end

  create_table "employee_leave_statuses", :force => true do |t|
    t.column "employee_id",      :integer,                  :null => false
    t.column "total_privilege",  :float,   :default => 0.0
    t.column "total_casual",     :float,   :default => 0.0
    t.column "total_sick",       :float,   :default => 0.0
    t.column "remain_privilege", :float,   :default => 0.0
    t.column "remain_casual",    :float,   :default => 0.0
    t.column "remain_sick",      :float,   :default => 0.0
    t.column "year",             :integer
  end

  def self.down
    drop_table :leaves
    drop_table :employee_leave_statuses
  end
end
