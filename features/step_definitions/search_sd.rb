Given(/^I launch the SCSB application$/) do
  #on(CollectionPage).new_test
  visit(LoginPage)
end

When(/^I login with valid credentails$/) do
on(LoginPage).login_with_valid_credentials('mkarthik3i','Testing1234', 'HTC')
#on(LoginPage).login_with_valid_credentials('superadmin','superadmin', 'HTC')
#on(LoginPage).login_with_valid_credentials('superadmin','123Welcome', 'HTC')
  #@current_page.wait_until('30',"Search page hasn't dispalyed"){on(SearchPage).txt_search_box_element.visible?}
end


When(/^I login with valid credential$/) do
  #step "I login with valid credentails"
  on(LoginPage).login_with_valid_credentials('mkarthik3i','Testing1234','HTC')
  #on(LoginPage).login_with_valid_credentials('superadmin','superadmin', 'HTC')
 # on(LoginPage).login_with_valid_credentials('superadmin','123Welcome', 'HTC')
  #@current_page.wait_until('30',"Search page hasn't dispalyed"){on(SearchPage).txt_search_box_element.visible?}
end

When(/^I login with valid credentials$/) do
  #step "I login with valid credentails"
  on(LoginPage).login_with_valid_credentials('mkarthik3i','Testing1234','HTC')
  #on(LoginPage).login_with_valid_credentials('superadmin','superadmin', 'HTC')
  #on(LoginPage).login_with_valid_credentials('superadmin','123Welcome', 'HTC')
  #@current_page.wait_until('30',"Search page hasn't dispalyed"){on(SearchPage).txt_search_box_element.visible?}
end

Then(/^I should see search page with following elements:$/) do |table|
  on(SearchPage).btn_show_facts_element.click
  sleep 3
  table.rows.each do |element|
    case element.first
      when 'search box'
        on(SearchPage).txt_search_box_element.visible?.should be_true, "Search box not displayed on search page"
      when 'Owning institution checkboxes'
        on(SearchPage).checkbox_ownInstId_element.visible?.should be_true, "Owning Institution checkboxes haven't displayed on search page"
      when 'Collections group checkboxs '
        on(SearchPage).checkbox_cgdId_element.visible?.should be_true, "Colloction group checkboxs haven't displayed on search page"
      when 'Avaliability checkbox'
        on(SearchPage).checkbox_availabilityId_element.visible?.should be_true, "Avaliability checkboxes haven't displayed on search page"
      when 'material type checkboxs'
        on(SearchPage).checkbox_materialTypeId_element.visible?.should be_true, "material type checkboxs haven't displayed on search page"
      when 'All fields dropdown'
        on(SearchPage).drdown_fieldName_element.visible?.should be_true, "All field hasn't displayed on search page"
      when 'Search button'
        on(SearchPage).btn_search_element.visible?.should be_true, "Search button hasn't displayed on search page"
      when 'Use Restriction'
        on(SearchPage).btn_use_restriction_element.visible?.should be_true, "Clear button hasn't displayed on search page"
      when 'Reset Search button '
        on(SearchPage).btn_resetSearch_element.visible?.should be_true, "New Search button hasn't displayed on search page"
    end
  end
end


Then(/^I should see the following checkbox filters are checked by defaultly:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end


When(/^I select All fields drop down$/) do
  on(SearchPage).drdown_fieldName_element.click
end

Then(/^I could see the following elements in all fields dropdown box:$/) do |table|
  table.rows.each do |element|
    txt_value = @current_page.text.upcase.include? (element.first.upcase)
    txt_value.should be_true, " #{element.first} text hasn't displayed in search page"
  end
end

When(/^I enter "(.*?)" in search box$/) do |txt_value|
  on(SearchPage).txt_search_box_element.value = txt_value
end

When(/^I select "(.*?)" in All fields dropdown box$/) do |field_value|
  on(SearchPage).drdown_fieldName_element.select (field_value)
end

When(/^I click search button$/) do
  on(SearchPage).btn_search_element.click
  sleep 5
end

Then(/^I should see the search results$/) do
  @current_page.wait_until(30, "Search Result hasn't displayed on search page"){on(SearchPage).table_searchResultsDiv_element.visible?}
  on(SearchPage).table_searchResultsDiv_element.visible?.should be_true, "Search Result hasn't displayed on search page"
end

Then(/^I should see the following buttons:$/) do |table|
  table.rows.each do |element|
    case element.first
      when 'Request Selected Records'
        on(SearchPage).btn_request_element.visible?.should be_true, "Request button is not visible in search result page"
      when'Export Selected Records '
        on(SearchPage).btn_export_element.visible?.should be_true, "Export button is not visible in search result page"
    end

  end
end

When(/^I search with invalid keyword in search box$/) do
  on(SearchPage).txt_search_box_element.value = "ewrrwerwe"
  on(SearchPage).btn_search_element.click
end

Then(/^I should see error message as "(.*?)"$/) do |txt_invalid_msg|
  @current_page.wait_until(30, "SearchResult hasn't displayed"){on(SearchPage).txt_searchResultsMsg_element.visible?}
  txt_value = on(SearchPage).txt_searchResultsMsg_element.text
  txt_invalid_msg.upcase.eql?(txt_value.upcase).should be_true, "Search result message hasn't displayed"
end

When(/^I select tital of bib record randomly$/) do
  on(SearchPage).lnk_title_of_bib_element.click
end

Then(/^I should navigate bib record detail page$/) do
  sleep 5
  on(SearchPage).tbl_bib_detail_page_element.visible?.should be_false, "Bib detail page hasn't displayed"
end

Then(/^I should see cocunt of the bib records$/) do
  @value =  on(SearchPage).txt_total_value_element.text
  @value = @value.gsub(",","")
end

When(/^I select each institution records count$/) do
  on(SearchPage).btn_show_facts_element.click
  sleep 3
  on(SearchPage).click_facts('NYPL')
  on(SearchPage).click_facts('Columbia')
  on(SearchPage).click_facts('Princeton')

  sleep 2
  on(SearchPage).click_facts('NYPL')
  on(SearchPage).btn_search_element.click
  value_1 =  on(SearchPage).txt_total_value_element.text
  value_1 = value_1.gsub(",","")

  on(SearchPage).btn_show_facts_element.click
  sleep 2
  on(SearchPage).click_facts('NYPL')
  on(SearchPage).click_facts('Columbia')
  on(SearchPage).btn_search_element.click
  value_2 =  on(SearchPage).txt_total_value_element.text
  value_2 = value_2.gsub(",","")

  on(SearchPage).btn_show_facts_element.click
  sleep 2
  on(SearchPage).click_facts('Columbia')
  on(SearchPage).click_facts('Princeton')
  on(SearchPage).btn_search_element.click
  value_3 =  on(SearchPage).txt_total_value_element.text
  value_3 = value_3.gsub(",","")

  @values = value_1.to_i + value_2.to_i + value_3.to_i

end

Then(/^I should match with total count of bib records$/) do
  @value.to_i.eql?(@values).should be_true, "Bib total records count is mismatch"
end
#TO uncheck the select/unselect all button and view approx error msg
When(/^I uncheck the Select or Unselect All Facets Option$/) do
  on(SearchPage).btn_show_facts_element.click
   sleep 2
  on(SearchPage).click_facts("Select / Unselect All Facets")
end

Then(/^I should see error message (At least one Bib Facet and one Item Facet must be checked to get results.)$/) do |txt_error_msg|
  sleep 2
  msg = on(SearchPage).txt_alert_alert_info_element.text
  msg.upcase.include?(txt_error_msg.upcase).should be_true, "At least one Search Facet Box needs to be checked to get results"
end


#When select/unselectAll button is checked ,check whether search results are appeared or not
When(/^I Select or Unselect All Facets Option is Checked$/) do
  on(SearchPage)
end

Then(/^I should be able to see search results$/) do
  on(SearchPage).table_searchResultsDiv_element.visible?.should be_true, "No records are loaded"
end


#To verify reset with New Search button
When(/^I click the reset Search button$/) do
  @current_page.wait_until(30,"Search button hasn't displayed"){on(SearchPage).btn_search_element.visible?}
  on(SearchPage).btn_search_element.click
  # @current_page.wait_until(30,"Reset Search button hasn't displayed"){on(SearchPage).btn_resetSearch_element.visible?}
  #on(SearchPage).btn_resetSearch_element.click
end

Then(/^I should be able to see Reset Search Page$/) do
  on(SearchPage).txt_search_box_element.visible?.should be_true, "Search box not displayed on search page"
  txt_serach_box = on(SearchPage).txt_search_box_element.attribute(:placeholder)
  txt_serach_box.include?('Type Text Here').should be_true,"Search box is not empty"
  on(SearchPage).table_searchResultsDiv_element.visible?.should be_false,"Search Results Displayed"
end


#-------automation5

When(/^I uncheck Recap In and Out Check boxes$/) do
  on(SearchPage).btn_show_facts_element.click
  sleep 2
  on(SearchPage).click_facts("In ReCAP")
  on(SearchPage).click_facts("Out")

end

  Then(/^I should see there is no search results on the page$/) do
  #on(SearchPage).txt_searchResultsMsg_element.visible?.should be_true,"No Error message Displayed"
  on(SearchPage).table_searchResultsDiv_element.visible?.should be_false,"Search Results Displayed"
end


#------------automation6

When(/^I uncheck nypl, princeton and columbia Check boxes$/) do
  on(SearchPage).btn_show_facts_element.click
  sleep 2
  on(SearchPage).click_facts('NYPL')
  on(SearchPage).click_facts('Columbia')
  on(SearchPage).click_facts('Princeton')
end

Then(/^Search results should be displayed$/) do
  on(SearchPage).table_searchResultsDiv_element.visible?.should be_true,"Search Results Not Displayed"
end


#---------------autoamtion7
# Then(/^I should see the following checkbox filters are checked$/) do
#   on(SearchPage).chck_owningInstitutionNYPL_element.enabled?
#   on(SearchPage).chck_owningInstitutionPUL_element.enabled?
#   on(SearchPage).chck_owningInstitutionCUL_element.enabled?
#   on(SearchPage).chck_shared_element.enabled?
#   on(SearchPage).chck_private_element.enabled?
#   on(SearchPage).chck_open_element.enabled?
#   on(SearchPage).chck_available_element.enabled?
#   on(SearchPage).chck_notAvailable_element.enabled?
#   on(SearchPage).chck_noRestriction_element.enabled?
#   on(SearchPage).chck_inLibraryUse_element.enabled?
#   on(SearchPage).chck_supervisedUse_element.enabled?
#   on(SearchPage).chck_monograph_element.enabled?
#   on(SearchPage).chck_serials_element.enabled?
#   on(SearchPage).chck_others_element.enabled?
# end


Then(/^I should see the following checkbox are checked$/) do |table|
  table.rows.each do |element|
    case element.first
      when 'Avaliability checkbox  '
        on(SearchPage).checkbox_availabilityId_element.exists?
      when 'Owning instituation checkboxes'
        on(SearchPage).checkbox_ownInstId_element.exists?
      when 'Colloction group checkboxs'
        on(SearchPage).checkbox_cgdId_element.exists?
      when 'material type checkboxs  '
        on(SearchPage).checkbox_materialTypeId_element.exists?
    end
  end
end

When(/^I click on Next Button$/) do
  sleep 5
  on(SearchPage).btn_nextbutton_element.click
end


When(/^I select option "(.*?)" in show checkbox$/) do |option_Value|
  on(SearchPage).chck_numOfRecordsId_element.select(option_Value)
end

Then(/^I should see the 25 search results$/) do
  @current_page.wait_until(30, "25records haven't displayed"){on(SearchPage).tbl_searchResultsDataPlus24_element.visible?}
  on(SearchPage).tbl_searchResultsDataPlus24_element.visible?.should be_true,"25 search results not there in application"
end


Then(/^I should see the 50 search results$/) do
  @current_page.wait_until(30, "50records haven't displayed"){on(SearchPage).tbl_searchResultsDataPlus49_element.visible?}
  on(SearchPage).tbl_searchResultsDataPlus49_element.visible?.should be_true,"50 search results not there in application"
end


Then(/^I should see the 100 search results$/) do
  @current_page.wait_until(30, "100records haven't displayed"){on(SearchPage).tbl_searchResultsDataPlus99_element.visible?}
  on(SearchPage).tbl_searchResultsDataPlus99_element.visible?.should be_true,"100 search results not there in application"
end


When(/^I click on showItemsIcon$/) do
  on(SearchPage).image_showItemsIcon_element.click
end

Then(/^I should see the search result of that showItemsIcon$/) do
  on(SearchPage).tbl_searchItemResultsRow5_element.visible?.should be_true,"no header displyed for show item icon"
end

When(/^I uncheck the InRecap CheckBox$/) do
  on(SearchPage).chck_notAvailable_element.click
end


When(/^I click on hideFacetsIcon$/) do
  on(SearchPage).btn_show_facts_element.click
  sleep 2
  on(SearchPage).btn_show_facts_element.click
  sleep 2
end

Then(/^Bib and Item Facets should not display$/) do
  on(SearchPage).facts_window_element.visible?.should be_false,"Facts window has displayed"
end


When(/^I click on showFacetsIcon$/) do
  on(SearchPage).btn_show_facts_element.click
  sleep 2
end

Then(/^Bib and Item Facets should be enabled and display$/) do
  on(SearchPage).facts_window?.should be_true,"Facts window hasn't displayed"
end


When(/^I uncheck all bib facets$/) do
  on(SearchPage).btn_show_facts_element.click
  sleep 2
  on(SearchPage).click_facts('NYPL')
  on(SearchPage).click_facts('Columbia')
  on(SearchPage).click_facts('Princeton')
  on(SearchPage).click_facts('Monograph')
  on(SearchPage).click_facts('Serials')
  on(SearchPage).click_facts('Others')
end

Then(/^I should see the error message as "(.*?)"$/) do |errormessage|
  errortext = on(SearchPage).txt_alert_alert_info_element.span_element.text
  errormessage.upcase.eql?(errortext.upcase).should be_true, "At least one Bib Facet Box and one Item Facet Box needs to be checked to get results hasn't displayed"
end


When(/^I uncheck all Item facets$/) do
  on(SearchPage).btn_show_facts_element.click
  sleep 2
  on(SearchPage).click_facts('Shared')
  on(SearchPage).click_facts('Private')
  on(SearchPage).click_facts('Open')
  on(SearchPage).click_facts("In ReCAP")
  on(SearchPage).click_facts('Out')
  on(SearchPage).click_facts("No Restriction")
  on(SearchPage).click_facts("In Library Use")
  on(SearchPage).click_facts("Supervised Use")
end

When(/^I click on clear button$/) do
  on(SearchPage).image_clearSearchText_element.click
end

Then(/^search text in the search box should be cleared$/) do
  on(SearchPage).txt_search_box_element.value = ""
end

=begin
require 'rubyvm/debug_inspector'

def breakpoint
  RubyVM::DebugInspector.open{|inspector|
    $inspector = inspector
    inspector.backtrace_locations.each_with_index{|location, i|
      b = inspector.frame_binding(i) # binding is nil if it is for when C's context
      vars = b ? b.eval('local_variables') : []
      puts [i, location.to_s, vars, b, inspector.frame_class(i)].inspect
    }
  }
end
=end