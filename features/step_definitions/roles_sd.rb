
And(/^I create new user with following "([^"]*)" for own institution only:$/) do |txt_roles|

   case txt_roles
     when 'SearchRequest'
       on(RolesPage).create_searchrequest_role
     when 'Collections'
       on(RolesPage).create_collection_role
     when 'ReCAP'
       on(RolesPage).create_recap_role
     when 'Search'
       on(RolesPage).create_search_role
     when 'Admin'
       on(RolesPage).create_admin_role
   end

 end

Then(/^I should see message user has been (Added Successfully)$/) do |txt_msg|
  sleep 5

  @current_page.text.upcase.include?(("#{$networklogin}" +" "+ txt_msg).upcase).should be_true, "User roles not created successfully"
  on(RolesPage).lnk_goback_element.click
  sleep 5
  on(RolesPage).txt_searchnetwork_login_element.value = $networklogin
  @current_page.wait_until(30, "Search button hasn't visible"){on(RolesPage).btn_search_element.visible?}
  on(RolesPage).btn_search_element.click
  sleep 2
  @current_page.text.include?($networklogin).should be_true, "User roles not created successfully"
  @current_page.wait_until(30, "Delete Image button hasn't visible"){on(RolesPage).img_delete_element.visible?}
  on(RolesPage).img_delete_element.click
  sleep 2
  @current_page.wait_until(30, "Delete button hasn't visible"){on(RolesPage).btn_delete_element.visible?}
  on(RolesPage).btn_delete_element.click
  sleep 2
  #@current_page.text.include?("#{$networklogin} + Deleted successfully").should be_true, "User id hasn't deleted successfully"
end

When(/^I can create (Search and Request|Collections|ReCAP|admin) user credentials$/) do |txt_roles|

 # step "I login with valid credentials"
  case txt_roles
    when "Search and Request"
      on(RolesPage).create_searchrequest_role
    when "Collections"
      on(RolesPage).create_collection_role
    when 'ReCap'
      on(RolesPage).create_recap_role
    when 'admin'
    on(RolesPage).create_admin_role
  end
   # on(SearchPage).lnk_logout_element.click
   # sleep 2
   # on(LoginPage).login_with_valid_credentials($networklogin, get_institution($networkinsti.to_i))

end




Then(/^I should see the following permissions:$/) do |table|

 table.rows.each do |txt_ele|
   case txt_ele.first
     when 'requests-owninstitution-Shared Open or Private'
       on(SearchPage).tab_request_element.visible?.should be_true, "request tap hasn't displayed"
     when 'requests-regardless of Inst-shared or open'

     when 'cancel own requests'
       on(SearchPage).tab_request_element.click
       sleep 2
       on(RequestPage).lnk_searchrequest_element.click
       sleep 2
       on(RequestPage).btn_search_element.click
       sleep 2
       on(RequestPage).btn_cancel_element.visible?.should be_true, "Request Cancel button hasn't displayed"
     when 'view/print reports'
       on(SearchPage).tab_reports_element.visible?.should be_true, "Report functionality hasn't dislayed"
     when 'search SCSB and export results'
       on(SearchPage).tab_search_element.visible?.should be_true, "Search page hasn't displayed"
     when 'write/edit CGD for own institution'
       on(SearchPage).tab_collection_element.visible?.should be_true, "Collection page hasn't displayed"
     when 'deaccession records for own institution'
     when 'Restriction to view barcode number in SCSB search'
        on(SearchPage).btn_search_element.click
        sleep 2
       @current_page.text.upcase.eql?('BARCODE').should be_false, "Barcode has displayed"
     when 'request items from any institution'
       on(SearchPage).tab_request_element.visible?.should be_true, "request tap hasn't displayed"
     when 'cancel any request'
       on(SearchPage).tab_request_element.click
       sleep 2
       on(RequestPage).lnk_searchrequest_element.click
       sleep 2
       on(RequestPage).btn_search_element.click
       sleep 2
   end

 end
 delete_testing_credentials rescue nil
end




def delete_testing_credentials
  on(SearchPage).lnk_logout_element.click
  sleep 2
  on(LoginPage).login_with_valid_credentials('superadmin', 'PUL')
  on(RolesPage).btn_user_element.click
  sleep 2
  on(RolesPage).txt_searchnetwork_login_element.value = $networklogin
  on(RolesPage).btn_search_element.click
  sleep 3
  @current_page.text.include?($networklogin).should be_true, "User roles not created successfully"
  on(RolesPage).img_delete_element.click
  sleep 3
  on(RolesPage).btn_delete_element.click
  sleep 3

end


When(/^I login with valid superadmin user credentials$/) do
  on(LoginPage).login_with_valid_credentials('superadmin', 'PUL')
end








def get_institution(txt_value)
  if txt_value == 1
     return 'PUL'
    elsif txt_value == 2
     return 'CUL'
  elsif txt_value == 3
     return 'NYPL'
  end

end

