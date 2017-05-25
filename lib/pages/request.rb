
class RequestPage
  include PageObject
  include DataMagic

  #span            :lnk_searchrequest,                                      :xpath => "html/body/section/div/div/div/div/div/div/form/fieldset/div[1]/div[2]/div[1]/div[2]/a/span"
  link            :lnk_searchrequest,                                     :link =>"Search Requests"
  link            :lnk_goback,                                            :link => "Go Back"
  button          :btn_search,                                            :id => 'searchRequestsButton'
  button          :btn_cancel,                                            :id => 'cancelRequestsButtonId'
  button          :create_button,                                         :id => 'createrequestsubmit'
  text_field      :txt_itembarcode,                                       :id =>'itemBarcodeId'
  text_field      :txt_patronbarcode,                                     :id => 'patronBarcodeId'
  text_field      :txt_emailid,                                           :id => 'patronEmailId'
  select          :sele_requestinginsti,                                  :id => 'requestingInstitutionId'
  text_field      :txt_notes,                                             :id => 'requestNotesId'
  select          :delivery_location,                                     :id => 'deliveryLocationId'
  button          :create_another_request,                                :id => 'anotherRequestButtonId'
  text_field      :itembarcode,                                           :id => 'itemBarcode'
  select          :request_status,                                        :id => 'requestStatus'

  select          :request_type,                                          :id => 'requestTypeId'
  text_field      :txt_start_page,                                        :id => 'StartPage'
  text_field      :txt_end_page,                                          :id => 'EndPage'
  text_field      :txt_title,                                             :id => 'ArticleChapterTitle'
  #button          :btn_close,                                             :css => "css=#cancelRequestModalContent > div.modal-header.bg-success > button.close"


  def populate_data(txt_insti)

    DataMagic.yml_directory ="#{Dir.getwd}"
    DataMagic.load('config/sitedb.yml')

    case txt_insti
      when 'PUL'
        data = data_for(:pul_patron_information)
        populate_page_with data
      when 'CUL'
        data = data_for(:cul_patron_information)
        populate_page_with data
      when 'NYPL'
        data = data_for(:nypl_patron_information)
        populate_page_with data
    end
  end

  def get_retrival_barcode
    wait_until(30, "Search link hasn't dispalyed"){lnk_searchrequest_element.visible?}
    lnk_searchrequest_element.click
    sleep 2
    request_status_element.select('RETRIEVAL ORDER PLACED')
    btn_search_element.click
    sleep 5
    barcode =[]

    i = 0
    begin
      barcode << text_field_element(:id=>"requestResults-#{i}").cell_elements[2].text rescue nil
      i= i+1
    end while i <=15
    barcode = barcode.reject{|i| i.empty?}
    return barcode.sample
  end

end