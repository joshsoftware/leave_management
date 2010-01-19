ActionMailer::Base.delivery_method = :sendmail
  recipient = Recipient.find( :all )^M
  i = 1
  recipient.each do |email|
    if recipient.size != i
      @recipient_email = @recipient_email.to_s + email.recipient_email.to_s + ","
    else
      @recipient_email = @recipient_email.to_s + email.recipient_email.to_s
    end
      i = i +1
  end
RECIPIENT_EMAIL = @recipient_email

ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS[:default]='%d/%m/%Y'



class LeaveNotifier < ActionMailer::Base
  def leave_details( leave, employee, link)  
      @recipients = RECIPIENT_EMAIL
      @cc = employee.office_email
      @subject = "Leave Application of #{employee.first_name} #{employee.last_name}"
      @title = "Leave Application"
      @from =  "#{employee.office_email}"
      @sent_on = sent_on=Time.now
      @body["employee"] = employee   
      @body["leave"] = leave
      @body["link"] = link
  end

  def leave_status_updated( leave, employee )
      @recipients = employee.office_email
      @cc = RECIPIENT_EMAIL
      @subject = "Applied Leave has #{leave.status}"
      @title = "Leave Application"
      @from =  'Administrator <administrator@joshsoftware.com>'
      @sent_on = sent_on=Time.now
      @body["employee"] = employee   
      @body["leave"] = leave
  end
end
