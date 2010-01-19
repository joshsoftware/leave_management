class Leave < ActiveRecord::Base
  belongs_to :employee
  validates_presence_of :no_of_days, :reason_of_leave,:employee_id,  :type_of_leave, :start_date_of_leave, :end_date_of_leave
  validates_numericality_of :no_of_days, :contact_no, :message => "must be numeric"  
  cattr_reader :per_page      
  def validate
    if !self.start_date_of_leave.blank? and !self.end_date_of_leave.blank?
      if (self.start_date_of_leave > self.end_date_of_leave ) 
        errors.add( :start_date_of_leave, " must be earlier than End Date of Leave ") 
      end
      #~ if  ( self.date >= self.start_date_of_leave or  self.date >= self.end_date_of_leave  )    
      #~ errors.add( "", " start and end date must be greater than today's date " ) 
      #~ end         
    end
    if  ( !self.no_of_days.blank? and self.no_of_days > 2  and  self.type_of_leave == "casual" )    
      errors.add_to_base(" Casual Leave can't take continiously more than two day's ")       
    end

    if ( !self.no_of_days.blank?  and self.no_of_days > 2  and  self.type_of_leave == "sick" )    
      errors.add_to_base(" Sick Leave can't take continiously more than two day's" )     
    end
    if !self.no_of_days.blank? 
      n_digits = self.no_of_days.to_s.scan(/[0-9]/).size
      if  n_digits > 2
        errors.add_to_base(" No of day's of leaves maximum two digit" )     
      end
    end
    if !self.no_of_days.blank?         
      if  self.no_of_days.to_i < 1
        errors.add_to_base(" Please Enter valid no of day's" )     
      end
    end
  end
end
