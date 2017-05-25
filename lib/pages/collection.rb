
class CollectionPage
  include PageObject

  text_field       :txt_search_box,                                 :id => 'barcodeFieldId'
  button           :btn_displayrecords,                             :id => 'displayRecords'
  div              :txt_note,                                        :id => "noteTextDivId"
  div              :txt_collectionresults,                          :id => 'collection-result-table_wrapper'

  span             :txt_barcode,                                    :id => "barcodeSpanId"
  link             :txt_title,                                      :id => "titleLinkId"
  span             :txt_cgd,                                        :id => "cgdSpanId"


  link             :lnk_title,                                      :id =>"titleLinkId"
  div              :txt_item_details,                               :id => 'collectionModalContent'
  span             :btn_editcgdaction,                              :xpath => "id('collectionOptionsDiv')/div/div/div[1]/label/span"
  span             :btn_deaccesionaction,                           :xpath => "id('collectionOptionsDiv')/div/div/div[2]/label/span"

  select           :sel_newcgdfield,                                :id => 'newCGD'
  text_field       :txt_cgdchangenotesfield,                        :id => 'CGDChangeNotes'
  text_field       :txt_deaccessiontype,                            :id => 'deaccessionType'
  select           :txt_deliverylocation,                           :id => 'DeliveryLocation'
  text_field       :txt_deaccessionnotesfield,                      :id => 'DeaccessionNotes'
  button           :btn_cgd_collectionupdatebutton,                 :id => 'collectionUpdateCgdButton'
  button           :btn_deaccession_collectionupdatebutton,         :id => 'collectionDeaccessionButton'
  span             :CGD_status,                                    :id => 'cgdSpanId'
  span             :CGD_status,                                    :id => 'cgdSpanId'
  button           :btn_close,                                     :class =>'close'


  def testing
    dp_connection = TestData.edit_database_connection
    @new_data = populate_page_with dp_connection
    return @new_data
  end


 end