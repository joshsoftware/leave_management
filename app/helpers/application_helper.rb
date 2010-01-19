# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_with_current_class(name, options = {}, html_options = nil)
    # This method adds 'class="current"' to any link that matches the current page, or matches a parent URI of the current page.
    opt = options.stringify_keys
    if (/#{url_for(options)}/ =~ url_for(params)) && opt['controller'] != "home" || current_page?(options)
      if html_options
        html_options = html_options.stringify_keys
        html_options['class'] = html_options['class'] + ' current'
      else
        html_options = {:class => 'current'}
      end
          
    end
    
    link_to name, options, html_options
  end
  $important_note = "1.Please mention the type of leave you wish to avail of.<br/>
        2.In case of sick leave, 3 or more days,kindly submit your Doctor's Certificate<br/>
        3.In case of Privileged leave for more than 3 days,kindly submit your leave application with a prior notice of 15 days.<br/>
        4.If the Leave application is not recieved within 2 days time from the date of leave availed (in case of sick/casual leave), the same will be treated will be treated as <b>Leave Without pay.</b></br></br></br>"
end
