
class RolesPage
  include PageObject
  include DataMagic

  link          :btn_user,                          :class => 'tab-users'
  text_field    :txt_searchnetwork_login,           :id    => 'searchNetworkId'
  text_field    :txt_search_email,                  :id    => 'userEmailId'
  button        :btn_search,                        :id    => 'searchButton'
  span          :img_delete,                        :xpath => "id('userDataDelete')/span"
  button        :btn_delete,                        :id    => 'deleteUserButton'
  link          :lnk_createruser,                   :id    => 'createRequest'

  text_field    :txt_network_login,                 :id    => 'networkLoginId'
  select        :slt_insti,                         :id    => 'institutionId'
  radio         :txt_role,                          :class => 'multiselect'
  radio         :select_admin,                      :xpath => "//div/ul/li[1]/a/span/label"
  radio         :select_searchrequest,              :xpath => "//div/ul/li[2]/a/span/label"
  radio         :select_collection,                 :xpath => "//div/ul/li[3]/a/span/label"
  radio         :select_recap,                      :xpath => "//div/ul/li[4]/a/span/label"
  radio         :select_search,                     :xpath => "//div/ul/li[5]/a/span/label"

  text_field    :txt_desc,                          :id    => 'userDescription'
  text_field    :txt_emailid,                       :id    => 'emailId'
  link          :lnk_goback,                        :id    => 'backLink'
  button        :btn_create,                        :id    => 'createButton'


  DataMagic.yml_directory ="#{Dir.getwd}"
  DataMagic.load('config/sitedb.yml')

  def create_admin_role
    navigate_to_user_page
    data = data_for(:createrole)
    populate_page_with data
    $networklogin = txt_network_login_element.value
    $networkinsti = slt_insti_element.value
    txt_role_element.click
    select_admin_element.click
    sleep 2
    txt_role_element.click
    sleep 2
    btn_create_element.click
  end

  def create_searchrequest_role
    navigate_to_user_page
    data = data_for(:createrole)
    populate_page_with data
    $networklogin = txt_network_login_element.value
    $networkinsti = slt_insti_element.value
    txt_role_element.click
    select_searchrequest_element.click
    sleep 2
    txt_role_element.click
    sleep 2
    btn_create_element.click
  end

  def create_collection_role
    navigate_to_user_page
    data = data_for(:createrole)
    populate_page_with data
    $networklogin = txt_network_login_element.value
    $networkinsti = slt_insti_element.value
    txt_role_element.click
    select_collection_element.click
    sleep 2
    txt_role_element.click
    sleep 2
    btn_create_element.click
  end

  def create_recap_role
    navigate_to_user_page
    data = data_for(:createrole)
    populate_page_with data
    $networklogin = txt_network_login_element.value
    $networkinsti = slt_insti_element.value
    txt_role_element.click
    select_recap_element.click
    sleep 2
    txt_role_element.click
    sleep 2
    btn_create_element.click
  end

  def create_search_role
    navigate_to_user_page
    data = data_for(:createrole)
    populate_page_with data
    $networklogin = txt_network_login_element.value
    $networkinsti = slt_insti_element.value
    txt_role_element.click
    select_search_element.click
    sleep 2
    txt_role_element.click
    sleep 2
    btn_create_element.click
  end

  def navigate_to_user_page
    btn_user_element.click
    wait_until(30,"User page hasn't displayed"){txt_searchnetwork_login_element.visible?}
   lnk_createruser_element.click
    wait_until(30,"roles page hasn't displayed"){txt_network_login_element.visible?}
  end


end

