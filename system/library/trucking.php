<?php
class Trucking {
		
	private $SenderID;
	private $PickupDoc;
	private $TruckingQuote;
	private $user_id;
	private $username;
	private $firstname;
	private $lastname;
	private $email;
	
	// CTS - Capital Transportation Services
	
	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->db = $registry->get('db');
		$this->user = $registry->get('user');
		$this->request = $registry->get('request');
		$this->session = $registry->get('session');
	
		//$this->SenderID = '2829'; #--- Test Account
		$this->SenderID = '565'; #--- Troy CTS Account
		
		if (isset($this->session->data['user_id'])) {
			$user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE user_id = '" . (int)$this->session->data['user_id'] . "' AND status = '1'");
		
			if ($user_query->num_rows) {
				$this->user_id = $user_query->row['user_id'];
				$this->username = $user_query->row['username'];
				$this->email = $user_query->row['email'];
				$this->firstname = $user_query->row['firstname'];
				$this->lastname = $user_query->row['lastname'];
			}
		}
	}
	
	public function getTrucking($data){
	
		$ctsrequest = file_get_contents('http://www.shipwithcts.com/cts/shiprite/rater.cfm?action=xml&UID=565&Class1=70&FromZip=' . $data['FromZip'] .
				'&ToZip=' . $data['ToZip'] . '&ShipDate='. $data['ShipDate'] .  '&Weight1='. $data['Weight1'] .'&cube='. $data['cube'].'');
		
		$this->session->data['cts_test']= $ctsrequest;
		
		$xml = simplexml_load_string($ctsrequest);
		
		$this->sessions->data['CTS_count']=$xml;
		
		$json = json_encode($xml);
	
		$array = json_decode($json,TRUE);
	
		$this->TruckingQuote = $array;
		
		return $array;
	
	}
	
	public function setPickupDoc_test(){
		$output = '<?xml version="1.0" encoding="UTF-8"?>';
		$output .= '<Transmission>';
		$output .= '<SenderID>2829</SenderID>';
		$output .= '<ReceiverID>CTS</ReceiverID>';
		$output .= '<MessageType>B</MessageType>';
		$output .= '<Contact>';
		$output .= '<Name>A Name</Name>';
		$output .= '<Phone>732-345-0818</Phone>';
		$output .= '<Email>ben@Troylines.com</Email>';
		$output .= '</Contact>';
		$output .= '<SpecialInstructions>Deliver before 3</SpecialInstructions>';
		$output .= '<BillofLading>123456</BillofLading>';
		$output .= '<ReferenceID></ReferenceID>';
		$output .= '<Terms>P</Terms>';
		$output .= '<PickupDate>2014-03-14</PickupDate>';
		$output .= '<DeliveryDate>2014-03-24</DeliveryDate>';
		$output .= '<Carrier>';
			$output .= '<Name>New England Motor Freight</Name>';
			$output .= '<Code>NEMF</Code>';
		$output .= '</Carrier>';
		$output .= '<Shipper>';
			$output .= '<name>ABC Company</name>';
			$output .= '<address1>123 North Street</address1>';
			$output .= '<address2></address2>';
			$output .= '<City>Atlanta</City>';
			$output .= '<State>GA</State>';
			$output .= '<ZipCode>30310</ZipCode>';
			$output .= '<contact>';
			$output .= '<name>test</name>';
				$output .= '<phone>123456</phone>';
			$output .= '<fax>123456</fax>';
			$output .= '<email>tom@troylines.com</email>';
			$output .= '</contact>';
			$output .= '<Hours>9-4</Hours>';
		$output .= '</Shipper>';
		$output .= '<Consignee>';
		$output .= '<name>ABC Company</name>';
		$output .= '<address1>123 North Street</address1>';
		$output .= '<address2></address2>';
		$output .= '<City>Atlanta</City>';
		$output .= '<State>GA</State>';
		$output .= '<ZipCode>30310</ZipCode>';
		$output .= '<contact>';
		$output .= '<name>test</name>';
		$output .= '<phone>123456</phone>';
		$output .= '<fax>123456</fax>';
		$output .= '<email>tom@troylines.com</email>';
		$output .= '</contact>';
		$output .= '<Hours>9-4</Hours>';
		$output .= '</Consignee>';
		$output .= '<BillTo>';
			$output .= '<name>ABC Company</name>';
			$output .= '<address1>123 North Street</address1>';
			$output .= '<address2></address2>';
			$output .= '<City>Atlanta</City>';
			$output .= '<State>GA</State>';
			$output .= '<ZipCode>30310</ZipCode>';
		$output .= '</BillTo>';
		$output .= '<PurchaseOrders>';
		$output .= '<PurchaseOrder>';
		$output .= '<ordernumber>12345</ordernumber>';
		$output .= '<packages>1</packages>';
		$output .= '<weight>894</weight>';
		$output .= '<palletslip>TRUE</palletslip>';
		$output .= '<extrainfo></extrainfo>';
		$output .= '</PurchaseOrder>';
		$output .= '</PurchaseOrders>';
		$output .= '<linedetail>';
			$output .= '<line>';
				$output .= '<product>';
					$output .= '<name>toys</name>';
					$output .= '<description>Toys</description>';
					$output .= '<description2></description2>';
					$output .= '<Hazmat>False</Hazmat>';
					$output .= '<HazmatNumber></HazmatNumber>';
					$output .= '<NMFC>12345</NMFC>';
					$output .= '<class>70</class>';
				$output .= '</product>';
				
				$output .= '<Handlingunit>';
					$output .= '<type>PAL</type>';
					$output .= '<quantity>2</quantity>';
				$output .= '</Handlingunit>';
				
				$output .= '<package>';
				$output .= '<type>CTN</type>';
				$output .= '<quantity>5</quantity>';
				$output .= '</package>';
				
				$output .= '<length></length>';
				$output .= '<width></width>';
				$output .= '<height></height>';
				$output .= '<cube></cube>';
				$output .= '<weight>984</weight>';
			$output .= '</line>';
		$output .= '</linedetail>';
		$output .= '<extraservices>';
			$output .= '<extraservice>lift</extraservice>';
		$output .= '</extraservices>';
		$output .= '<datestamp>2014-03-14</datestamp>';
		$output .= '<timestamp>10:40:00</timestamp>';
		$output .= '</Transmission>';
	
		$this->PickupDoc = htmlspecialchars($output);
		return $output;
	}
	
	public function sendCTS(){
		$result = $this->transmitCTS();
		
		return $result;
	}
	
	public function transmitCTS(){
		$senderid = $this->SenderID;
		
		/* $output = $this->sendCTS_test();
		$output = $this->setPickupDoc();
		$this->session->data['pickupdoc_test']= htmlspecialchars($output);
		$this->session->data['pickupdoc_test2']=htmlspecialchars($output2);
		*/
		
		$output = $this->setPickupDoc();
		
		$this->session->data['CTS_pickupdoc'] = htmlspecialchars($output);
		
		$client = new SoapClient("http://www.shipwithcts.com/cts/BOL/srdapp.cfc?wsdl");
		
		$params = array ('SenderID' => $senderid,'PickupDoc'=> $output );
		
		$client = new nusoap_client('http://www.shipwithcts.com/cts/BOL/srdapp.cfc?wsdl', 'wsdl');
		
		$result = $client->call('bImport', $params);
		
		// Check for a fault
		if ($client->fault){$this->session->data['CTS_error']= $result;}
			
		$this->session->data['sendCTS']= $this->data['sendCTS'] = 'sent';
		
		
		 
		
		return $result;
		
	}
	
	public function setReview(){
		if (isset($this->session->data['truckingpickup']) && !empty($this->session->data['truckingpickup'])){
			//CTS trucker
			if (isset($this->session->data['truckingpickup']) && substr($this->session->data['truckingpickup'],0,4) =='CTS-') {
			
			$data['truckingpickup']=$this->session->data['truckingpickup'];
			$delimit = strrpos($data['truckingpickup'],'-');
			$delimit2 = strrpos($data['truckingpickup'],':');
			$carriercode = substr($data['truckingpickup'],$delimit+1,$delimit2-4);
			$carrier = $carriercode.':'. explode(':',$data['truckingpickup'])[1];
			//$carrier ='CTS-AXSQ:Absolute Transportation';
			} 
			
			else {
			// Manual trucker
			$data['truckingpickup']=$this->session->data['truckingpickup'];
			$carriercode =null;
			$carrier = null;
			
			}
			
		}else{
			$data['truckingpickup']=null;
			$carriercode =null;
			$carrier = null;
		};
		
		if (isset($this->session->data['service_por'])&& !empty($this->session->data['service_por'])){
			$data['service_por']=$this->session->data['service_por'];
			$vector = explode(",",$data['service_por']);
		}else{$data['service_por']='';
		$vector = null;
		};
		
		if (isset($this->session->data['warehouse_info'])&& !empty($this->session->data['warehouse_info'])){
			$data['warehouse_info']=$this->session->data['warehouse_info'];
			if($data['warehouse_info']['warecity']==null){
				$vector2 = explode(",",$data['warehouse_info']['wareaddress1']);
			}else {
			$vector2 = explode(",",$data['warehouse_info']['warecity']);
			}
		}else{$data['warehouse_info']=null;
		$vector2 = null;
		};

		if (isset($this->session->data['pickupShipper'])&& !empty($this->session->data['pickupShipper'])){
			$data['pickupShipper']=$this->session->data['pickupShipper'];
			}else{
				$data['pickupShipper']=null;
			}
		if (isset($this->session->data['pickupAddress'])&& !empty($this->session->data['pickupAddress'])){
			$data['pickupAddress']=$this->session->data['pickupAddress'];
		}else{
			$data['pickupAddress']=null;
		}	

		if (isset($this->session->data['pickupcontact'])&& !empty($this->session->data['pickupcontact'])){
			$data['pickupcontact']=$this->session->data['pickupcontact'];
		}else{
			$data['pickupcontact']=null;
		}
		if (isset($this->session->data['pickuptelephone'])&& !empty($this->session->data['pickuptelephone'])){
			$data['pickuptelephone']=$this->session->data['pickuptelephone'];
		}else{
			$data['pickuptelephone']=null;
		}
		if (isset($this->session->data['pickupemail'])&& !empty($this->session->data['pickupemail'])){
			$data['pickupemail']=$this->session->data['pickupemail'];
		}else{
			$data['pickupemail']=null;
		}
		
		if (isset($this->session->data['pickupfax'])&& !empty($this->session->data['pickupfax'])){
			$data['pickupfax']=$this->session->data['pickupfax'];
		}else{
			$data['pickupfax']=null;
		}
		if (isset($this->session->data['service_zip'])&& !empty($this->session->data['service_zip'])){
			$data['service_zip']=$this->session->data['service_zip'];
		}else{
			$data['service_zip']=null;
		}
		$city = $vector[0];
		$state = substr($vector[1],1,3);
		
		$consignee_city= $vector2[0];
		
		if(isset($data['warehouse_info']) &&  $data['warehouse_info']['warecity']==null){
			$vector2 = explode(",",$data['warehouse_info']['wareaddress']);
			$consignee_state= substr($vector2[1],1,3);
			
		}else {
			$consignee_state= substr($vector2[1],1,3);
		}
		
		
		
		$items = array(
			'Carrier '=>$carrier,
			'Shipper Name'=>$data['pickupShipper'],
			'Shipper Address'=>	$data['pickupAddress'],
			'Shipper City,State'	=>	$city.', '.$state,
			'Shipper Zip Code'=>$data['service_zip'],
			'Shipper Contact'=>	$data['pickupcontact'],
			'Shipper Phone'	=>	$data['pickuptelephone'],
			'Shipper Fax'	=>	$data['pickupfax'],
			'Shipper Email'	=>	$data['pickupemail'],
			'Consignee Name' =>	$data['warehouse_info']['warename1'],
			'Consignee Addres' =>	$data['warehouse_info']['wareaddress'],
			'Consignee City, State' =>	$consignee_city.', '.$consignee_state,
			'Consignee Zip' =>	$data['warehouse_info']['warehouse_zip'],
			'Consignee Contact' =>$data['warehouse_info']['warecontact'],
			'Consignee Phone' =>	$data['warehouse_info']['warephone'],
			'Consignee Fax' =>	$data['warehouse_info']['warefax'],
			'Consignee Fax' =>	$data['warehouse_info']['wareemail'],
				
		);
		
		
		return $items;
	
	}
	public function setPickupDoc(){
		$senderid = $this->SenderID;
		$user_firstname = $this->firstname;
		$user_lastname =$this->lastname;
		$user_email =$this->email;
		
		
		$output = '<?xml version="1.0" encoding="UTF-8"?>';
		$output .= '<Transmission>';
		$output .= '<SenderID>'.$senderid .'</SenderID>';
		$output .= '<ReceiverID>CTS</ReceiverID>';
		$output .= '<MessageType>B</MessageType>';
		
		$output .= '<Contact>';
		$output .= '<Name>'.$user_firstname .' '.$user_lastname.'</Name>';
		$output .= '<Phone>732-345-0818</Phone>';
		$output .= '<Email>'.$user_email .'</Email>';
		$output .= '</Contact>';
		
		if(isset($this->session->data['bkpuspecinst'])){
			$output .= '<SpecialInstructions>'.$this->session->data['bkpuspecinst'].'</SpecialInstructions>';
		} else {
			$output .= '<SpecialInstructions></SpecialInstructions>';
		}
		
		$output .= '<BillofLading>'.$this->session->data['bookingnumber'].$this->session->data['service_portofloading_code'].$this->session->data['service_portofdest_code'] .'</BillofLading>';
		$output .= '<ReferenceID></ReferenceID>';
		$output .= '<Terms>P</Terms>';
		
		$output .= '<PickupDate>'.$this->session->data['readydate'].'</PickupDate>';
		$output .= '<DeliveryDate>'.date("Y-m-d", strtotime($this->session->data['readydate']. " + 1 days ")) .'</DeliveryDate>';
		$output .= '<Carrier>';
		$carriername = explode(':',$this->session->data['truckingpickup'])[1];
		$delimit = strrpos($this->session->data['truckingpickup'],'-');
		$delimit2 = strrpos($this->session->data['truckingpickup'],':');
		$carriercode = substr($this->session->data['truckingpickup'],$delimit+1,$delimit2-4);
		$output .= '<Name>'.$carriername.'</Name>';
		$output .= '<Code>'.$carriercode.'</Code>';
		$output .= '</Carrier>';
		
		$output .= '<Shipper>';
		$output .= '<name>'.htmlspecialchars($this->session->data['pickupShipper'], ENT_QUOTES).'</name>';
		$output .= '<address1>'.$this->session->data['pickupAddress'].'</address1>';
		// @todo - add second line to address
	
		$output .= '<address2></address2>';
		
		$vector = explode(",",$this->session->data['service_por']);
		$city = $vector[0];
		$state = substr($vector[1],1,3);
		$output .= '<City>'. $city .'</City>';
		$output .= '<State>'. $state .'</State>';
		$output .= '<ZipCode>'.$this->session->data['service_zip'].'</ZipCode>';
		
		$output .= '<contact>';
		$output .= '<name>'.htmlspecialchars($this->session->data['pickupcontact'], ENT_QUOTES).'</name>';
		$output .= '<phone>'.$this->session->data['pickuptelephone'].'</phone>';
		$output .= '<fax>'.$this->session->data['pickupfax'].'</fax>';
		$output .= '<email>'.$this->session->data['pickupemail'].'</email>';
		$output .= '</contact>';
		if(isset($this->session->data['pickupReceivingHrs']) && !empty($this->session->data['pickupReceivingHrs'])){
		$output .= '<Hours>'.$this->session->data['pickupReceivingHrs'].'</Hours>';
		}
		$output .= '</Shipper>';
		
		$output .= '<Consignee>';
		$output .= '<name>'.htmlspecialchars($this->session->data['warehouse_info']['warename1'], ENT_QUOTES).'</name>';
		$output .= '<address1>'.$this->session->data['warehouse_info']['wareaddress'].'</address1>';
		$output .= '<address2></address2>';
		
		$vector2 = explode(",",$this->session->data['warehouse_info']['warecity']);
		$consignee_city= $vector2[0];
		$consignee_state= substr($vector2[1],1,3);

		$output .= '<City>'.$consignee_city.'</City>';
		$output .= '<State>'.$consignee_state.'</State>';
		$output .= '<ZipCode>'.$this->session->data['warehouse_info']['warehouse_zip'].'</ZipCode>';
		$output .= '<contact>';
		$output .= '<name>'.htmlspecialchars($this->session->data['warehouse_info']['warecontact'], ENT_QUOTES).'</name>';
		$output .= '<phone>'.$this->session->data['warehouse_info']['warephone'].'</phone>';
		$output .= '<fax>'.$this->session->data['warehouse_info']['warefax'].'</fax>';
		$output .= '<email>'.$this->session->data['warehouse_info']['wareemail'].'</email>';
		$output .= '</contact>';
		$output .= '<Hours>9-4</Hours>';
		$output .= '</Consignee>';
		
		$output .= '<BillTo>';
			$output .= '<name>Troy Container Line. Ltd.</name>';
			$output .= '<address1>C/O Capital Transportation Systems</address1>';
			$output .= '<address2>P.O. Box 441326</address2>';
			$output .= '<City>Kennesaw</City>';
			$output .= '<State>GA</State>';
			$output .= '<ZipCode>30160</ZipCode>';
		$output .= '</BillTo>';
		
	
		$output .= '<linedetail>';
			$output .= '<line>';
			$output .= '<product>';
				$output .= '<name>'. htmlspecialchars($this->session->data['commodity'], ENT_QUOTES).'</name>';
				$output .= '<description></description>';
				$output .= '<description2></description2>';
		if($this->session->data['hazardous'] && $this->session->data['hazardous'] == 'true'){		
				$output .= '<Hazmat>True</Hazmat>';
				$output .= '<HazmatNumber></HazmatNumber>';
		} else {
				$output .= '<Hazmat>False</Hazmat>';
				$output .= '<HazmatNumber></HazmatNumber>';
		}		
				$output .= '<NMFC></NMFC>';
				$output .= '<class>70</class>';
			$output .= '</product>';
			
			$output .= '<Handlingunit>';
				$output .= '<type>OTH</type>';
				$output .= '<quantity>0</quantity>';
			$output .= '</Handlingunit>';
			
			$output .= '<package>';
				$output .= '<type>PCS</type>';
				$output .= '<quantity>'.$this->session->data['commodity_pieces'].'</quantity>';
			$output .= '</package>';
			
			$output .= '<length></length>';
			$output .= '<width></width>';
			$output .= '<height></height>';
			$output .= '<cube>'.$this->session->data['commodity_cft'].'</cube>';
			$output .= '<weight>'.$this->session->data['commodity_lbs'].'</weight>';
			$output .= '</line>';
		$output .= '</linedetail>';
		
		$output .= '<extraservices>';
		if(isset($this->session->data['pickuppresidentialpu']) && $this->session->data['pickuppresidentialpu']=='true'){
			$output .= '<extraservice>RESIP</extraservice>';
		}
		if(isset($this->session->data['pickupliftgate']) && $this->session->data['pickupliftgate']=='true'){
			$output .= '<extraservice>LIFT</extraservice>';
		}
		if(isset($this->session->data['pickupexcesslen']) && $this->session->data['pickupexcesslen']=='true'){
			$output .= '<extraservice>EXCE</extraservice>';
		}
		if(isset($this->session->data['hazardous']) && $this->session->data['hazardous']=='true'){
			$output .= '<extraservice>HAZM</extraservice>';
		}
		$output .= '</extraservices>';
	
		$output .= '<datestamp>'.date("Y-m-d").'</datestamp>';
		$output .= '<timestamp>'.date("H:i:s").'</timestamp>';
		$output .= '</Transmission>';
		
		return $output;
	}
	
	public function sendCTS_test(){
		$senderid = $this->SenderID;
		
		$output = '<?xml version="1.0" encoding="UTF-8"?>';
		$output .= '<Transmission>';
		$output .= '<SenderID>2829</SenderID>';
		$output .= '<ReceiverID>CTS</ReceiverID>';
		$output .= '<MessageType>B</MessageType>';
		$output .= '<Contact>';
			$output .= '<Name>A Name</Name>';
			$output .= '<Phone>732-345-0818</Phone>';
			$output .= '<Email>ben@Troylines.com</Email>';
		$output .= '</Contact>';
		if(isset($this->session->data['innerpiece'])){
		$output .= '<SpecialInstructions>'.$this->session->data['innerpiece'].'</SpecialInstructions>';
		} else {
		$output .= '<SpecialInstructions></SpecialInstructions>';
		}
		$output .= '<BillofLading>123456</BillofLading>';
		$output .= '<ReferenceID></ReferenceID>';
		$output .= '<Terms>P</Terms>';
		$output .= '<PickupDate>2014-03-14</PickupDate>';
		$output .= '<DeliveryDate>2014-03-24</DeliveryDate>';
	//
		$output .= '<Carrier>';
		$output .= '<Name>New England Motor Freight</Name>';
		$output .= '<Code>NEMF</Code>';
		$output .= '</Carrier>';
		
		$output .= '<Shipper>';
			$output .= '<name>ABC Company</name>';
			$output .= '<address1>123 North Street</address1>';
			$output .= '<address2></address2>';
			$output .= '<City>Atlanta</City>';
			$output .= '<State>GA</State>';
			$output .= '<ZipCode>30310</ZipCode>';

			$output .= '<contact>';
			$output .= '<name>test</name>';
			$output .= '<phone>123456</phone>';
			$output .= '<fax>123456</fax>';
			$output .= '<email>tom@troylines.com</email>';
			$output .= '</contact>';
		
			$output .= '<Hours>9-4</Hours>';
		$output .= '</Shipper>';
		
		$output .= '<Consignee>';
			$output .= '<name>ABC Company</name>';
			$output .= '<address1>123 North Street</address1>';
			$output .= '<address2></address2>';
			$output .= '<City>Atlanta</City>';
			$output .= '<State>GA</State>';
			$output .= '<ZipCode>30310</ZipCode>';
			$output .= '<contact>';
			$output .= '<name>test</name>';
			$output .= '<phone>123456</phone>';
			$output .= '<fax>123456</fax>';
			$output .= '<email>tom@troylines.com</email>';
			$output .= '</contact>';
			$output .= '<Hours>9-4</Hours>';
		$output .= '</Consignee>';
		
		$output .= '<BillTo>';
			$output .= '<name>ABC Company</name>';
			$output .= '<address1>123 North Street</address1>';
			$output .= '<address2></address2>';
			$output .= '<City>Atlanta</City>';
			$output .= '<State>GA</State>';
			$output .= '<ZipCode>30310</ZipCode>';
		$output .= '</BillTo>';
		
		
		
		$output .= '<linedetail>';
			$output .= '<line>';
			$output .= '<product>';
			$output .= '<name>toys</name>';
			$output .= '<description>Toys</description>';
			$output .= '<description2></description2>';
			$output .= '<Hazmat>False</Hazmat>';
			$output .= '<HazmatNumber></HazmatNumber>';
			$output .= '<NMFC>12345</NMFC>';
			$output .= '<class>70</class>';
			$output .= '</product>';
		
			$output .= '<Handlingunit>';
			$output .= '<type>PAL</type>';
			$output .= '<quantity>2</quantity>';
			$output .= '</Handlingunit>';
		
			$output .= '<package>';
			$output .= '<type>CTN</type>';
			$output .= '<quantity>5</quantity>';
			$output .= '</package>';
		
			$output .= '<length></length>';
			$output .= '<width></width>';
			$output .= '<height></height>';
			$output .= '<cube></cube>';
			$output .= '<weight>984</weight>';
			$output .= '</line>';
		$output .= '</linedetail>';
		
		$output .= '<extraservices>';
			$output .= '<extraservice>lift</extraservice>';
		$output .= '</extraservices>';
		$output .= '<datestamp>2014-03-14</datestamp>';
		$output .= '<timestamp>10:40:00</timestamp>';
		$output .= '</Transmission>';
		
		
		return $output;
	}

}
?>