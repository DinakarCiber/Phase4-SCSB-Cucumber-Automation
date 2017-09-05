
class LoginPage
  include PageObject

  #page_url "http://tst-recap-direct.htcinc.com:9091"
  #page_url "http://uat-recap.htcinc.com:9091"
   page_url "https://tst-recap.htcinc.com/"
  #page_url "https://uat-recap.htcinc.com/"
  #page_url "https://scsb.recaplib.org"


  div           :login_cont,                        :class => 'login-content'
  text_field    :txt_login,                         :id=>'networkloginid'
  text_field    :txt_pwd,                           :id=>'loginpassword'
  select        :select_insti,                      :id=> 'institution'
  button        :btn_submit,                        :id=>'submitBtn'
  div           :frm_tweet,                         :id =>'twitter-widget-0'
  div           :logo_recap,                        :class => 'recap-logo-container'
  image         :logo_cul,                          :class => 'member-columbia-univ-logo'
  image         :logo_pul,                          :class => 'member-princeton-univ-logo'
  image         :logo_nypl,                         :class => 'member-ny-public-logo'
  link          :lnk_home,                          :xpath => 'html/body/div[1]/div/div/div/div[1]/div[1]/div'
  link          :lnk_facility,                      :xpath => 'html/body/div[2]/div/div/div/div[2]/ul/li[2]/a'
  link          :lnk_opertations,                   :xpath => 'html/body/div[2]/div/div/div/div[2]/ul/li[3]/a'
  link          :lnk_collections,                   :xpath => 'html/body/div[2]/div/div/div/div[2]/ul/li[4]/a'
  link          :lnk_information,                   :xpath => 'html/body/div[2]/div/div/div/div[2]/ul/li[5]/a'


  paragraph     :txt_userNameError,                 :id => 'userNameError'

  #HTC User
  text_field     :htc_login,                       :id => 'username'
  text_field     :htc_pwd,                         :id => 'password'
  button         :lnk_login,                       :name => 'submit'
  text_field     :txt_search_box,                  :id => 'fieldValue'

  def login_with_valid_credentials(txt_username,txt_pwd, txt_insti)
    select_insti_element.select(txt_insti)
    btn_submit_element.click
    wait_until(30, "HTC login page hasn't loaded"){htc_pwd_element.visible?}
    htc_login_element.value = txt_username
    htc_pwd_element.value = txt_pwd
    sleep 3
    lnk_login_element.click
    #binding.pry
    wait_until(30, "Search page hasn't loaded"){txt_search_box_element.visible?}
  end

end

