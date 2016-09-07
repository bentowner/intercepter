<?php
/**
 * Page-level DocBlock
 */

/**
 * Access to the Data layer specific to Quotations.
 *
 * @author Ben Towner
 * @name Quotations - model - Service
 * @version 2.0
 * @package LCL - Web application
 * @link http://www.TroyContainerLine.com/webapp/lcl
 */
class ModelServiceQuotations extends Model {

	/**
	 * Adds the Object quote into the existing Object table.
	 *
	 * @param object $data Serialized session values for the Quote Object
	 * @param string $qtnumber reference quote number
	 */
	public function addQuoteObject($data,$qtnumber){
		//$removeold = $this->db->query("delete from eps_objects where object_description = 'Quote' and SYSDATE() < date_add(timestamp,interval + 30 MINUTE)");

		if ($this->object->Quote($qtnumber)!=='false'){
			$this->db->query("INSERT INTO eps_objects SET object_data = '". $this->db->escape($data) ."', object_ref = '". $qtnumber ."' ,user_id = '" . $this->user->getId() . "', object_description = 'Quote'");
		}
	}

	public function releaseQuoteObject($data){
		$this->db->query("delete from eps_objects where object_description = 'Quote' and object_ref = '" . $data . "'");

	}

	public function statusQuoteObject($data){
		$this->db->query("update eps_objects set status = 'Changes Pending' where object_description = 'Quote' and object_ref =  '" . $data . "'");

	}

	public function getQuoteObject($data){
		$this->db->query("delete FROM eps_objects where object_description = 'Quote' and curtime()>'".$this->config->get('config_draft_time') ."'");
		$query = $this->db->query("SELECT object_data FROM eps_objects where object_description = 'Quote'	and user_id ='" . $this->user->getId(). "'  and object_ref = '" . $data . "' ");

		return $query->row['object_data'];
	}

	public function getQuoteObjectData($data){
		$query = $this->db->query("SELECT * FROM eps_objects where object_description = 'Quote' and user_id ='" . $this->user->getId(). "'  and object_ref = '" . $data . "' ");

		return $query->rows;
	}

	public function getQuoteObjects(){
		$this->db->query("delete FROM eps_objects where object_description = 'Quote' and curtime()>'".$this->config->get('config_draft_time') ."'");

		$query = $this->db->query("SELECT object_ref FROM eps_objects where object_description = 'Quote' and user_id ='" . $this->user->getId() . "'
				and SYSDATE() < date_add(timestamp,interval + 30 MINUTE)
				");

		$results = $query->rows;

		foreach($results as $result) {
			$result_array[]=$result['object_ref'];
		}

		if ($results){
			return $result_array;
		}else {

			return '';
		}
	}

	public function getObjectTime($data){
		$query= $this->db->query("SELECT DATE_FORMAT(date_add(timestamp, interval + 90 MINUTE),'%H:%i:%s') as endtime,'7:00 p.m.' as time from eps_objects where object_description ='Quote' and object_ref ='".$data."' ");
		return $query->row['time'];
	}

	public function totalQuoteObjects(){
		$this->db->query("delete FROM eps_objects where object_description = 'Quote' and SYSDATE() >= date_add(timestamp,interval + 30 MINUTE)");
		$query = $this->db->query("SELECT count(*) as total FROM eps_objects where object_description = 'Quote' and user_id ='" . $this->user->getId() . "' ");
		return $query->row['total'];
	}

	public function addQuotes() {
		$time = "select date(now())";
		$currentDate = $this->db->query($time);


		$sql = "INSERT INTO `epspe_quotes` ";

		$sql .= "	set


			 QtBL= '" . $this->session->data['QtBL'] . "',
			 QtFCurr= '" . $this->session->data['QtFCurr'] . "',
			`QtNumb`= '" . $this->session->data['quote_no']. "',
			`QtDisp`= '" . $this->session->data['qtstatus']. "',
			`QtDate`= '" . $this->session->data['quotedate']. "',
			`QtCust`= '" . $this->session->data['customer']. "',

		";

		if(isset($this->session->data['routedcargo']) && $this->session->data['routedcargo'] == 'true'){
				$sql  .="
				QtCustomer= concat('" .$this->db->escape($this->session->data['customerName']) ."','\n','S/'
				'" .$this->db->escape($this->session->data['customerSignator']) ."','\n','C/',
				'". $this->db->escape($this->session->data['customerConsignee'])."','\n','N/',
				'". $this->db->escape($this->session->data['customerNotify'])."' ),"	;
		}	else {
			$sql.=

				"`QtCustomer`= '" . $this->db->escape($this->session->data['customerdetail']). "',";
		}


			$sql.="

			`QtRcpt`= '" . $this->db->escape($this->session->data['service_por']). "',
			";

		if(isset($this->session->data['email_to_send'])&& !empty($this->session->data['email_to_send'])){
			if (sizeof($this->session->data['email_to_send'])>'1'){
				for ($x = 0; $x < sizeof($this->session->data['email_to_send']); $x++) {
						$contacts[]=$this->session->data['email_to_send'][$x]['contact'];

					}
				for ($x = 0; $x < sizeof($this->session->data['email_to_send']); $x++) {
					$emails[]=$this->session->data['email_to_send'][$x]['email'];

				}


				$contact = implode(",",$contacts);
				$email =  implode(",",$emails);


				$sql .="qtemail= '" . $email. "',
					QtCont= '" . $contact . "',

					";

			} else{
				$sql .="qtemail= '" . $this->session->data['email_to_send'][0]['email']. "',
					QtCont= '" . $this->session->data['email_to_send'][0]['contact'] . "',

					";
			}


		} else{
			$sql .="qtemail= null,
					QtCont= null,
					";
		}
			$sql  .="


			`QTPhon`= '" . $this->session->data['custtelephone']. "',
			`QTFax`= '" . $this->session->data['custfax']. "',
			`QTBy`= '" . $this->session->data['quoteby']. "',
			`QtExp`='". $this->session->data['day_to_expire']. "',
			`qtorig`= '" . $this->session->data['service_portofloading_code']. "',
			`qtdest`= '" . $this->session->data['service_portofdest_code']. "',
			 qtem = '" . $this->session->data['commodity_measure']. "',
			`qtpcs`= '" . $this->session->data['commodity_pieces']. "',
			`qtpkg`= '" . $this->session->data['commodity_package_type']. "',

			qtwgte=  '" . round($this->session->data['commodity_lbs'],0) . "',
			qtwgtm=  '" . round($this->session->data['commodity_kg'],1) . "',
			qtcube= '" . round($this->session->data['commodity_cft'],0) . "',
			qtcubm='" . round($this->session->data['commodity_cbm'],3) . "',

			`qtcomm`= '" . $this->session->data['commodity']. "',
			`qtcarr`= '" . $this->session->data['carrier_code']. "',
			`qtfreq`= '" . $this->session->data['frequency']. "',
			`qttt`= '" . $this->session->data['transittime']. "',
			`qtcomments`= '" . $this->db->escape($this->session->data['qtcomments']). "',
			`qtPDOC`= '" . $this->session->data['service_pod']. "',
			qthaz= '".$this->session->data['hazardous']."',
			qtpereff='" . $this->session->data['personaleffects']. "',
			`qtzipcode`= '" . $this->session->data['service_zip']. "',
			qttruckinfo ='" . $this->session->data['truckingpickup']. "',
		    qttrucknotes = '" . $this->session->data['truckingshipid']. "',
			`qtcoload` = '".$this->session->data['qtcoload']."',
			qtpresell='" . $this->session->data['rates_precarriage'] . "',
			qtpresellmin='" . $this->session->data['rates_precarriage_min'] . "',
			qtofsell= '" . $this->session->data['rates_oceanfreight']. "',
			qtofsellmin= '" . $this->session->data['rates_oceanfreight_min']. "',
			qtthcsell= '" . $this->session->data['rates_thc']. "',
			qtthcsellmin= '" . $this->session->data['rates_thc_min']. "',
			qtbafsell= '" . $this->session->data['rates_baf']. "',
			qtbafsellmin= '" . $this->session->data['rates_baf_min']. "',
			qtfuel= '" . $this->session->data['rates_fuelsurcharge']. "',
			qtdestdocsell= '" . $this->session->data['rates_destdocs'] . "',
			qtblfeesell= '" . $this->session->data['rates_bolfee_min']. "',
			qtcclrsell = '" . $this->session->data['rates_customsclearance'] . "',
			qtwharfsell='" . $this->session->data['rates_aesfilingbytcl'] . "',
			qtoncarrsell= '" . $this->session->data['rates_oncarriage']. "',
			qtoncarrcost= '" . $this->session->data['costs_oncarriage_quote']. "',
			qtbrok= '" . $this->session->data['brokerage'] . "',
			qthazsell= '" . $this->session->data['rates_hazardous']. "',
			qthazsellmin= '" . $this->session->data['rates_hazardous_min']. "',
			qthazcost= '" . $this->session->data['rates_hazsurcharge_cost']. "',
			qthazcostmin= '" . $this->session->data['rates_hazsurcharge_cost_min']. "',
			qtportcongsell=  '" . $this->session->data['rates_docsreqd'] . "',
			qtwsch = '" . $this->session->data['rates_wgtsurcharge'] . "',
			qtprecost= '" . $this->session->data['truckingrate']. "',
			qtprecostmin= '" . $this->session->data['truckingrate_min']. "',
			qtchass= '" . $this->session->data['rates_chassissurcharge']. "',
			qtresid = '" . $this->session->data['pickuppresidentialpu'] . "',
			qtliftgate = '" . $this->session->data['pickupliftgate'] . "',
			qtexlen = '" . $this->session->data['pickupexcesslen'] . "',
			qteufee= '" . $this->session->data['rates_eufilingfee_min'] . "',
			qtrouted = '" . $this->session->data['routedcargo'] . "',
			QTfaxFl= '" . $this->session->data['QTfaxFl'] . "',
			QtRE= '" . $this->session->data['QtRE'] . "',
			qtfree= '" . $this->session->data['notes_ops'] . "',
			qtratbasis1= '" . $this->session->data['qtratbasis1'] . "',
			qtopoint= '" . $this->session->data['qtopoint'] . "',
			qtdpoint= '" . $this->session->data['qtdpoint'] . "',
			qtforl= '" . $this->session->data['qtforl'] . "',
			qtshowcarr= '0',

			";

			if(isset($this->session->data['qtbookdate'])&& !empty($this->session->data['qtbookdate'])){
				$sql .="qtbookdate= '" . $this->session->data['qtbookdate'] . "',	";
			} else{
				$sql .="qtbookdate=null, ";
			}

			$sql  .="
			";

			if(isset($this->session->data['qtbook2date'])&& !empty($this->session->data['qtbook2date'])){
				$sql .="qtbook2date= '" . $this->session->data['qtbook2date'] . "',	";
			} else{
				$sql .="qtbook2date=null, ";
			}

			$sql  .="
			";

			if(isset($this->session->data['qtbook3date'])&& !empty($this->session->data['qtbook3date'])){
				$sql .="qtbook3date= '" . $this->session->data['qtbook3date'] . "',	";
			} else{
				$sql .="qtbook3date=null, ";
			}

			$sql  .="

			qtbooking= '" . $this->session->data['qtbooking'] . "',
			qtbooking2= '" . $this->session->data['qtbooking2'] . "',
			qtbooking3= '" . $this->session->data['qtbooking3'] . "',
			qtbooking4= '" . $this->session->data['qtbooking4'] . "',
			";

			if(isset($this->session->data['qtbook4date'])&& !empty($this->session->data['qtbook4date'])){
				$sql .="qtbook4date= '" . $this->session->data['qtbook4date'] . "',	";
			} else{
				$sql .="qtbook4date=null, ";
			}

			$sql  .="

			qtramp= '" . $this->session->data['qtramp'] . "',
			qtramporig= '" . $this->session->data['qtramporig'] . "',
			qtscac= '" . $this->session->data['qtscac'] . "',
			qtireq= '" . $this->session->data['qtireq'] . "',
			qtires= '" . $this->session->data['qtires'] . "',
			qtfcls= '" . $this->session->data['qtfcls'] . "',
			qtlcls= '" . $this->session->data['qtlcls'] . "',
			qttruck= '" . $this->session->data['qttruck'] . "',
			QtCustName= '" . $this->session->data['QtCustName'] . "',
			qtsrep= '" . $this->session->data['qtsrep'] . "',
			Qtwhfmin= '" . $this->session->data['Qtwhfmin'] . "',
			qtdesc1= '" . $this->session->data['qtdesc1'] . "',
			qtdesc2= '" . $this->session->data['entry_other2'] . "',
			qtdesc3= '" . $this->session->data['entry_other3'] . "',
			qtdesc4= '" . $this->session->data['entry_other4'] . "',
			qtdesc2sell= '" . $this->session->data['rates_other2'] . "',
			qtdesc3sell= '" . $this->session->data['rates_other3'] . "',
			qtdesc4sell= '" . $this->session->data['rates_other4'] . "',
			qtdesc2cost= '" . $this->session->data['costs_desc2cost_quote'] . "',
			qtdesc3cost= '" . $this->session->data['costs_desc3cost_quote'] . "',
			qtdesc5= '" . $this->session->data['qtdesc5'] . "',
			qtdoor= '" . $this->session->data['qtdoor'] . "',
			qtusage= '" . $this->session->data['qtusage'] . "',
			qtauto= '" . $this->session->data['qtauto'] . "',
			qtwcfm= '" . $this->session->data['qtwcfm'] . "',
			qtwsc= '" . $this->session->data['qtwsc'] . "',
			qtotxt= '" . $this->session->data['qtotxt'] . "',
			qtwharfcost= '" . $this->session->data['qtwharfcost'] . "',
			qtoncarrcurr= '" . $this->session->data['costs_oncarriage_currency'] . "',
			qtwarsell= '" . $this->session->data['qtwarsell'] . "',

			qtwarcost= '" . $this->session->data['qtwarcost'] . "',
			qtportconcost= '" . $this->session->data['qtportconcost'] . "',
			qtcostpc= '" . $this->session->data['truckingrate_min'] . "',
			qtcostins= '" . $this->session->data['qtcostins'] . "',
			qtcostinout= '" . $this->session->data['qtcostinout'] . "',
			qtcostpallet= '" . $this->session->data['qtcostpallet'] . "',
			qtcostseg= '" . $this->session->data['qtcostseg'] . "',
			qtcostother= '" . $this->session->data['qtcostother'] . "',
			qtcostothtest= '" . $this->session->data['qtcostothtest'] . "',
			qtcosthaz= '" . $this->session->data['qtcosthaz'] . "',
			qtcostps= '" . $this->session->data['qtcostps'] . "',
			qtcreate= '" . $this->session->data['qtcreate'] . "',
			qtthccostr= '" . $this->session->data['qtthccostr'] . "',
			qtthccostm= '" . $this->session->data['qtthccostm'] . "',
			qtdestdcost= '" . $this->session->data['costs_destdocs_quote'] . "',
			qtcustccost= '" . $this->session->data['costs_customsclearance_quote'] . "',
			qtthcosttot= '" . $this->session->data['costs_thc2_quote'] . "',
			qtdesc4cost= '" . $this->session->data['qtdesc4cost'] . "',

			qtbademail= '" . $this->session->data['qtbademail'] . "',
			qttrktt= '" . $this->session->data['truckingdays'] . "',
			qtsales= '" . $this->session->data['qtsales'] . "',
			qtcorf= '" . $this->session->data['qtcorf'] . "',
			qtpalletcost= '" . $this->session->data['qtpalletcost'] . "',
			qtshowdestc= '" . $this->session->data['qtshowdestc'] . "',
			qtshowcft= '" . $this->session->data['qtshowcft'] . "',
			qtlhfuel= '" . $this->session->data['qtlhfuel'] . "',
			qtlhtype= '" . $this->session->data['qtlhtype'] . "',
			qtdestchgtext= '" . $this->session->data['qtdestchgtext'] . "',
			qtdestchgamt= '" . $this->session->data['costs_destcharges_quote'] . "',
			qtapptrqd= '" . $this->session->data['pickupappt'] . "',
			qtbtob= '" . $this->session->data['qtbtob'] . "',
			qtholdtruck= '" . $this->session->data['qtholdtruck'] . "',
			qtcustref= '" . $this->session->data['customerref'] . "',
			qtsalesemail=	'" . $this->session->data['cpytosalesrep'] . "'	,
  	        qtlhrate= 	'" . $this->session->data['rates_line_haul'] . "'	,
			qtlhmin=	'" . $this->session->data['rates_line_haul_min'] . "'


		ON DUPLICATE KEY UPDATE

			`QtDisp`= '" . $this->session->data['qtstatus']. "',
			QtBL= '" . $this->session->data['QtBL'] . "',
			QtFCurr= '" . $this->session->data['QtFCurr'] . "',
			`QtDate`= '" . $this->session->data['quotedate']. "',
			`QtCust`= '" . $this->session->data['customer']. "',
		";

		if(isset($this->session->data['routedcargo']) && $this->session->data['routedcargo'] == 'true'){
				$sql  .="
				QtCustomer= concat('" .$this->db->escape($this->session->data['customerName']) ."','\n','S/'
				'" .$this->db->escape($this->session->data['customerSignator']) ."','\n','C/',
				'". $this->db->escape($this->session->data['customerConsignee'])."','\n','N/',
				'". $this->db->escape($this->session->data['customerNotify'])."' ),"	;
		}	else {
			$sql.=

				"`QtCustomer`= '" . $this->db->escape($this->session->data['customerdetail']). "',";
		}


			$sql.="
			`QtRcpt`= '" . $this->db->escape($this->session->data['service_por']). "',";

		if(isset($this->session->data['email_to_send'])&& !empty($this->session->data['email_to_send'])){
			if (sizeof($this->session->data['email_to_send'])>'1'){
				for ($x = 0; $x < sizeof($this->session->data['email_to_send']); $x++) {
						$contacts[]=$this->session->data['email_to_send'][$x]['contact'];

					}
				for ($x = 0; $x < sizeof($this->session->data['email_to_send']); $x++) {
					$emails[]=$this->session->data['email_to_send'][$x]['email'];

				}

				$contact = implode(",",$contacts);
				$email =  implode(",",$emails);

				$sql .="qtemail= '" . $email. "',
					    QtCont= '" . $contact . "',
					";

			} else{
				$sql .="qtemail= '" . $this->session->data['email_to_send'][0]['email']. "',
					QtCont= '" . $this->session->data['email_to_send'][0]['contact'] . "',
					";
			}
		} else{
			$sql .="qtemail= null,
					QtCont= null,	";
		}
			$sql  .="
			`QTPhon`= '" . $this->session->data['custtelephone']. "',
			`QTFax`= '" . $this->session->data['custfax']. "',
			`QTBy`= '" . $this->session->data['quoteby']. "',
			`QtExp`='". $this->session->data['day_to_expire']. "',
			`qtorig`= '" . $this->session->data['service_portofloading_code']. "',
			`qtdest`= '" . $this->session->data['service_portofdest_code']. "',
			 qtem = '" . $this->session->data['commodity_measure']. "',
			`qtpcs`= '" . $this->session->data['commodity_pieces']. "',
			`qtpkg`= '" . $this->session->data['commodity_package_type']. "',
			qtwgte=  '" . round($this->session->data['commodity_lbs'],0) . "',
			qtwgtm=  '" . round($this->session->data['commodity_kg'],1) . "',
			qtcube= '" . round($this->session->data['commodity_cft'],0) . "',
			qtcubm='" . round($this->session->data['commodity_cbm'],3) . "',
			`qtcomm`= '" . $this->session->data['commodity']. "',
			`qtcarr`= '" . $this->session->data['carrier_code']. "',
			`qtfreq`= '" . $this->session->data['frequency']. "',
			`qttt`= '" . $this->session->data['transittime']. "',
			`qtcomments`=  '" . $this->db->escape($this->session->data['qtcomments']). "',
			`qtPDOC`= '" . $this->session->data['service_pod']. "',
			qthaz= '".$this->session->data['hazardous']."',
			qtpereff='" . $this->session->data['personaleffects']. "',
			`qtzipcode`= '" . $this->session->data['service_zip']. "',
		    qttruckinfo ='" . $this->session->data['truckingpickup']. "',
			qttrucknotes = '" . $this->session->data['truckingshipid']. "',
			`qtcoload` = '".$this->session->data['qtcoload']."',

			qtpresell='" . $this->session->data['rates_precarriage'] . "',
			qtpresellmin='" . $this->session->data['rates_precarriage_min'] . "',
			qtofsell= '" . $this->session->data['rates_oceanfreight']. "',
			qtofsellmin= '" . $this->session->data['rates_oceanfreight_min']. "',
			qtthcsell= '" . $this->session->data['rates_thc']. "',
			qtthcsellmin= '" . $this->session->data['rates_thc_min']. "',
			qtbafsell= '" . $this->session->data['rates_baf']. "',
			qtbafsellmin= '" . $this->session->data['rates_baf_min']. "',
			qtfuel= '" . $this->session->data['rates_fuelsurcharge']. "',
			qtdestdocsell= '" . $this->session->data['rates_destdocs'] . "',
			qtblfeesell= '" . $this->session->data['rates_bolfee_min']. "',
			qtcclrsell = '" . $this->session->data['rates_customsclearance'] . "',
			qtwharfsell='" . $this->session->data['rates_aesfilingbytcl'] . "',
			qtoncarrsell= '" . $this->session->data['rates_oncarriage']. "',
			qtoncarrcost= '" . $this->session->data['costs_oncarriage_quote']. "',
			qtbrok= '" . $this->session->data['brokerage'] . "',
			qthazsell= '" . $this->session->data['rates_hazardous']. "',
			qthazsellmin= '" . $this->session->data['rates_hazardous_min']. "',
			qthazcost= '" . $this->session->data['rates_hazsurcharge_cost']. "',
			qthazcostmin= '" . $this->session->data['rates_hazsurcharge_cost_min']. "',
			qtportcongsell=  '" . $this->session->data['rates_docsreqd'] . "',
			qtwsch = '" . $this->session->data['rates_wgtsurcharge'] . "',
			qtprecost= '" . $this->session->data['truckingrate']. "',
			qtprecostmin= '" . $this->session->data['truckingrate_min']. "',
			qtchass= '" . $this->session->data['rates_chassissurcharge']. "',
			qtresid = '" . $this->session->data['pickuppresidentialpu'] . "',
			qtliftgate = '" . $this->session->data['pickupliftgate'] . "',
			qtexlen = '" . $this->session->data['pickupexcesslen'] . "',
			qteufee= '" .$this->session->data['rates_eufilingfee_min'] . "',
			qtrouted= '" . $this->session->data['routedcargo'] . "',
			QTfaxFl= '" . $this->session->data['QTfaxFl'] . "',
			QtRE= '" . $this->session->data['QtRE'] . "',
			qtfree= '" . $this->session->data['notes_ops'] . "',
			qtratbasis1= '" . $this->session->data['qtratbasis1'] . "',
			qtopoint= '" . $this->session->data['qtopoint'] . "',
			qtdpoint= '" . $this->session->data['qtdpoint'] . "',
			qtforl= '" . $this->session->data['qtforl'] . "',
			qtshowcarr= '0',
			";

			if(isset($this->session->data['qtbookdate'])&& !empty($this->session->data['qtbookdate'])){
				$sql .="qtbookdate= '" . $this->session->data['qtbookdate'] . "',	";
			} else{
				$sql .="qtbookdate=null, ";
			}

			$sql  .="
			";

			if(isset($this->session->data['qtbook2date'])&& !empty($this->session->data['qtbook2date'])){
				$sql .="qtbook2date= '" . $this->session->data['qtbook2date'] . "',	";
			} else{
				$sql .="qtbook2date=null, ";
			}

			$sql  .="
			";

			if(isset($this->session->data['qtbook3date'])&& !empty($this->session->data['qtbook3date'])){
				$sql .="qtbook3date= '" . $this->session->data['qtbook3date'] . "',	";
			} else{
				$sql .="qtbook3date=null, ";
			}

			$sql  .="

			qtbooking= '" . $this->session->data['qtbooking'] . "',
			qtbooking2= '" . $this->session->data['qtbooking2'] . "',
			qtbooking3= '" . $this->session->data['qtbooking3'] . "',
			qtbooking4= '" . $this->session->data['qtbooking4'] . "',
			";

			if(isset($this->session->data['qtbook4date'])&& !empty($this->session->data['qtbook4date'])){
				$sql .="qtbook4date= '" . $this->session->data['qtbook4date'] . "',	";
			} else{
				$sql .="qtbook4date=null, ";
			}

			$sql  .="
			qtramp= '" . $this->session->data['qtramp'] . "',
			qtramporig= '" . $this->session->data['qtramporig'] . "',
			qtscac= '" . $this->session->data['qtscac'] . "',
			qtireq= '" . $this->session->data['qtireq'] . "',
			qtires= '" . $this->session->data['qtires'] . "',
			qtfcls= '" . $this->session->data['qtfcls'] . "',
			qtlcls= '" . $this->session->data['qtlcls'] . "',
			qttruck= '" . $this->session->data['qttruck'] . "',
			QtCustName= '" . $this->session->data['QtCustName'] . "',
			qtsrep= '" . $this->session->data['qtsrep'] . "',
			Qtwhfmin= '" . $this->session->data['Qtwhfmin'] . "',
			qtdesc1= '" . $this->session->data['qtdesc1'] . "',
			qtdesc2= '" . $this->session->data['entry_other2'] . "',
			qtdesc3= '" . $this->session->data['entry_other3'] . "',
			qtdesc4= '" . $this->session->data['entry_other4'] . "',
			qtdesc2sell= '" . $this->session->data['rates_other2'] . "',
			qtdesc3sell= '" . $this->session->data['rates_other3'] . "',
			qtdesc4sell= '" . $this->session->data['rates_other4'] . "',
			qtdesc2cost= '" . $this->session->data['costs_desc2cost_quote'] . "',
			qtdesc3cost= '" . $this->session->data['costs_desc3cost_quote'] . "',
			qtdesc5= '" . $this->session->data['qtdesc5'] . "',
			qtdoor= '" . $this->session->data['qtdoor'] . "',
			qtusage= '" . $this->session->data['qtusage'] . "',
			qtauto= '" . $this->session->data['qtauto'] . "',
			qtwcfm= '" . $this->session->data['qtwcfm'] . "',
			qtwsc= '" . $this->session->data['qtwsc'] . "',
			qtotxt= '" . $this->session->data['qtotxt'] . "',
			qtwharfcost= '" . $this->session->data['qtwharfcost'] . "',
			qtoncarrcurr= '" . $this->session->data['costs_oncarriage_currency'] . "',
			qtwarsell= '" . $this->session->data['qtwarsell'] . "',
			qtwarcost= '" . $this->session->data['qtwarcost'] . "',
			qtportconcost= '" . $this->session->data['qtportconcost'] . "',
			qtcostpc= '" . $this->session->data['truckingrate_min'] . "',
			qtcostins= '" . $this->session->data['qtcostins'] . "',
			qtcostinout= '" . $this->session->data['qtcostinout'] . "',
			qtcostpallet= '" . $this->session->data['qtcostpallet'] . "',
			qtcostseg= '" . $this->session->data['qtcostseg'] . "',
			qtcostother= '" . $this->session->data['qtcostother'] . "',
			qtcostothtest= '" . $this->session->data['qtcostothtest'] . "',
			qtcosthaz= '" . $this->session->data['qtcosthaz'] . "',
			qtcostps= '" . $this->session->data['qtcostps'] . "',
			qtcreate= '" . $this->session->data['qtcreate'] . "',
			qtthccostr= '" . $this->session->data['qtthccostr'] . "',
			qtthccostm= '" . $this->session->data['qtthccostm'] . "',
			qtdestdcost= '" . $this->session->data['costs_destdocs_quote'] . "',
			qtcustccost= '" . $this->session->data['costs_customsclearance_quote'] . "',
			qtthcosttot= '" . $this->session->data['costs_thc2_quote'] . "',
			qtdesc4cost= '" . $this->session->data['qtdesc4cost'] . "',
			qtbademail= '" . $this->session->data['qtbademail'] . "',
			qttrktt= '" . $this->session->data['truckingdays'] . "',
			qtsales= '" . $this->session->data['qtsales'] . "',
			qtcorf= '" . $this->session->data['qtcorf'] . "',
			qtpalletcost= '" . $this->session->data['qtpalletcost'] . "',
			qtshowdestc= '" . $this->session->data['qtshowdestc'] . "',
			qtshowcft= '" . $this->session->data['qtshowcft'] . "',
			qtlhfuel= '" . $this->session->data['qtlhfuel'] . "',
			qtlhtype= '" . $this->session->data['qtlhtype'] . "',
			qtdestchgtext= '" . $this->session->data['qtdestchgtext'] . "',
			qtdestchgamt= '" . $this->session->data['costs_destcharges_quote'] . "',
			qtapptrqd='" . $this->session->data['pickupappt'] . "',
			qtbtob= '" . $this->session->data['qtbtob'] . "',
			qtholdtruck= '" . $this->session->data['qtholdtruck'] . "',
			qtcustref= '" . $this->session->data['customerref'] . "',
			qtsalesemail=	'" . $this->session->data['cpytosalesrep'] . "'	,
			qtlhrate= 	'" . $this->session->data['rates_line_haul'] . "'	,
			qtlhmin=	'" . $this->session->data['rates_line_haul_min'] . "'
					";

		$this->session->data['test_insert_quote'] = $sql;

		$this->db->query($sql);



	}

	public function addQuotes_sync(){
		$time = "select date(now())";
		$currentDate = $this->db->query($time);


		$sql = "INSERT INTO `epspe_quotes_temp` ";

		$sql .= "	set

				QtBL= '" . $this->session->data['QtBL'] . "',
			QtFCurr= '" . $this->session->data['QtFCurr'] . "',
			`QtNumb`= '" . $this->session->data['quote_no']. "',
			`QtDisp`= '" . $this->session->data['qtstatus']. "',
			`QtDate`= '" . $this->session->data['quotedate']. "',
			`QtCust`= '" . $this->session->data['customer']. "',
			";

		if(isset($this->session->data['routedcargo']) && $this->session->data['routedcargo'] == 'true'){
				$sql  .="
				QtCustomer= concat('" .$this->db->escape($this->session->data['customerName']) ."','\n','S/'
				'" .$this->db->escape($this->session->data['customerSignator']) ."','\n','C/',
				'". $this->db->escape($this->session->data['customerConsignee'])."','\n','N/',
				'". $this->db->escape($this->session->data['customerNotify'])."' ),"	;
		}	else {
			$sql.=

				"`QtCustomer`= '" . $this->db->escape($this->session->data['customerdetail']). "',";
		}


			$sql.="
			`QtRcpt`= '" . $this->db->escape($this->session->data['service_por']). "',
			";

		if(isset($this->session->data['email_to_send'])&& !empty($this->session->data['email_to_send'])){
			if (sizeof($this->session->data['email_to_send'])>'1'){
				for ($x = 0; $x < sizeof($this->session->data['email_to_send']); $x++) {
						$contacts[]=$this->session->data['email_to_send'][$x]['contact'];

					}
				for ($x = 0; $x < sizeof($this->session->data['email_to_send']); $x++) {
					$emails[]=$this->session->data['email_to_send'][$x]['email'];

				}

				$contact = implode(",",$contacts);
				$email =  implode(",",$emails);

				$sql .="qtemail= '" . $email. "',
					    QtCont= '" . $contact . "',
					";

			} else{
				$sql .="qtemail= '" . $this->session->data['email_to_send'][0]['email']. "',
					QtCont= '" . $this->session->data['email_to_send'][0]['contact'] . "',
					";
			}
		} else{
			$sql .="qtemail= null,
					QtCont= null,	";
		}
			$sql  .="
			`QTPhon`= '" . $this->session->data['custtelephone']. "',
			`QTFax`= '" . $this->session->data['custfax']. "',
			`QTBy`= '" . $this->session->data['quoteby']. "',
			`QtExp`='". $this->session->data['day_to_expire']. "',
			`qtorig`= '" . $this->session->data['service_portofloading_code']. "',
			`qtdest`= '" . $this->session->data['service_portofdest_code']. "',
			 qtem = '" . $this->session->data['commodity_measure']. "',
			`qtpcs`= '" . $this->session->data['commodity_pieces']. "',
			`qtpkg`= '" . $this->session->data['commodity_package_type']. "',
			qtwgte=  '" . round($this->session->data['commodity_lbs'],0) . "',
			qtwgtm=  '" . round($this->session->data['commodity_kg'],1) . "',
			qtcube= '" . round($this->session->data['commodity_cft'],0) . "',
			qtcubm='" . round($this->session->data['commodity_cbm'],3) . "',
			`qtcomm`= '" . $this->session->data['commodity']. "',
			`qtcarr`= '" . $this->session->data['carrier_code']. "',
			`qtfreq`= '" . $this->session->data['frequency']. "',
			`qttt`= '" . $this->session->data['transittime']. "',
			`qtcomments`= '" . $this->db->escape($this->session->data['qtcomments'])."\n".$this->db->escape($this->session->data['comments']). "',
			`qtPDOC`= '" . $this->session->data['service_pod']. "',
			qthaz= '".$this->session->data['hazardous']."',
			qtpereff='" . $this->session->data['personaleffects']. "',
			`qtzipcode`= '" . $this->session->data['service_zip']. "',
			qttruckinfo ='" . $this->session->data['truckingpickup']. "',
		    qttrucknotes = '" . $this->session->data['truckingshipid']. "',
			`qtcoload` = '".$this->session->data['qtcoload']."',

			qtpresell='" . $this->session->data['rates_precarriage'] . "',
			qtpresellmin='" . $this->session->data['rates_precarriage_min'] . "',
			qtofsell= '" . $this->session->data['rates_oceanfreight']. "',
			qtofsellmin= '" . $this->session->data['rates_oceanfreight_min']. "',
			qtthcsell= '" . $this->session->data['rates_thc']. "',
			qtthcsellmin= '" . $this->session->data['rates_thc_min']. "',
			qtbafsell= '" . $this->session->data['rates_baf']. "',
			qtbafsellmin= '" . $this->session->data['rates_baf_min']. "',
			qtfuel= '" . $this->session->data['rates_fuelsurcharge']. "',
			qtdestdocsell= '" . $this->session->data['rates_destdocs'] . "',
			qtblfeesell= '" . $this->session->data['rates_bolfee_min']. "',
			qtcclrsell = '" . $this->session->data['rates_customsclearance'] . "',
			qtwharfsell='" . $this->session->data['rates_aesfilingbytcl'] . "',
			qtoncarrsell= '" . $this->session->data['rates_oncarriage']. "',
			qtoncarrcost= '" . $this->session->data['costs_oncarriage_quote']. "',
			qtbrok= '" . $this->session->data['brokerage'] . "',
			qthazsell= '" . $this->session->data['rates_hazardous']. "',
			qthazsellmin= '" . $this->session->data['rates_hazardous_min']. "',
			qthazcost= '" . $this->session->data['rates_hazsurcharge_cost']. "',
			qthazcostmin= '" . $this->session->data['rates_hazsurcharge_cost_min']. "',
			qtportcongsell=  '" . $this->session->data['rates_docsreqd'] . "',
			qtwsch = '" . $this->session->data['rates_wgtsurcharge'] . "',
			qtprecost= '" . $this->session->data['truckingrate']. "',
			qtprecostmin= '" . $this->session->data['truckingrate_min']. "',
			qtchass= '" . $this->session->data['rates_chassissurcharge']. "',
			qtresid = '" . $this->session->data['pickuppresidentialpu'] . "',
			qtliftgate = '" . $this->session->data['pickupliftgate'] . "',
			qtexlen = '" . $this->session->data['pickupexcesslen'] . "',
			qteufee= '" . $this->session->data['rates_eufilingfee_min'] . "',
			qtrouted = '" . $this->session->data['routedcargo'] . "',
			QTfaxFl= '" . $this->session->data['QTfaxFl'] . "',
			QtRE= '" . $this->session->data['QtRE'] . "',
			qtfree= '" . $this->session->data['notes_ops'] . "',
			qtratbasis1= '" . $this->session->data['qtratbasis1'] . "',
			qtopoint= '" . $this->session->data['qtopoint'] . "',
			qtdpoint= '" . $this->session->data['qtdpoint'] . "',
			qtforl= '" . $this->session->data['qtforl'] . "',
			qtshowcarr= '0',
			";

			if(isset($this->session->data['qtbookdate'])&& !empty($this->session->data['qtbookdate'])){
				$sql .="qtbookdate= '" . $this->session->data['qtbookdate'] . "',	";
			} else{
				$sql .="qtbookdate=null, ";
			}

			$sql  .="
			";

			if(isset($this->session->data['qtbook2date'])&& !empty($this->session->data['qtbook2date'])){
				$sql .="qtbook2date= '" . $this->session->data['qtbook2date'] . "',	";
			} else{
				$sql .="qtbook2date=null, ";
			}

			$sql  .="
			";

			if(isset($this->session->data['qtbook3date'])&& !empty($this->session->data['qtbook3date'])){
				$sql .="qtbook3date= '" . $this->session->data['qtbook3date'] . "',	";
			} else{
				$sql .="qtbook3date=null, ";
			}

			$sql  .="

			qtbooking= '" . $this->session->data['qtbooking'] . "',
			qtbooking2= '" . $this->session->data['qtbooking2'] . "',
			qtbooking3= '" . $this->session->data['qtbooking3'] . "',
			qtbooking4= '" . $this->session->data['qtbooking4'] . "',
			";

			if(isset($this->session->data['qtbook4date'])&& !empty($this->session->data['qtbook4date'])){
				$sql .="qtbook4date= '" . $this->session->data['qtbook4date'] . "',	";
			} else{
				$sql .="qtbook4date=null, ";
			}

			$sql  .="
			qtramp= '" . $this->session->data['qtramp'] . "',
			qtramporig= '" . $this->session->data['qtramporig'] . "',
			qtscac= '" . $this->session->data['qtscac'] . "',
			qtireq= '" . $this->session->data['qtireq'] . "',
			qtires= '" . $this->session->data['qtires'] . "',
			qtfcls= '" . $this->session->data['qtfcls'] . "',
			qtlcls= '" . $this->session->data['qtlcls'] . "',
			qttruck= '" . $this->session->data['qttruck'] . "',
			QtCustName= '" . $this->session->data['QtCustName'] . "',
			qtsrep= '" . $this->session->data['qtsrep'] . "',
			Qtwhfmin= '" . $this->session->data['Qtwhfmin'] . "',
			qtdesc1= '" . $this->session->data['qtdesc1'] . "',
			qtdesc2= '" . $this->session->data['entry_other2'] . "',
			qtdesc3= '" . $this->session->data['entry_other3'] . "',
			qtdesc4= '" . $this->session->data['entry_other4'] . "',
			qtdesc2sell= '" . $this->session->data['rates_other2'] . "',
			qtdesc3sell= '" . $this->session->data['rates_other3'] . "',
			qtdesc4sell= '" . $this->session->data['rates_other4'] . "',
			qtdesc2cost= '" . $this->session->data['costs_desc2cost_quote'] . "',
			qtdesc3cost= '" . $this->session->data['costs_desc3cost_quote'] . "',
			qtdesc5= '" . $this->session->data['qtdesc5'] . "',
			qtdoor= '" . $this->session->data['qtdoor'] . "',
			qtusage= '" . $this->session->data['qtusage'] . "',
			qtauto= '" . $this->session->data['qtauto'] . "',
			qtwcfm= '" . $this->session->data['qtwcfm'] . "',
			qtwsc= '" . $this->session->data['qtwsc'] . "',
			qtotxt= '" . $this->session->data['qtotxt'] . "',
			qtwharfcost= '" . $this->session->data['qtwharfcost'] . "',
			qtoncarrcurr= '" . $this->session->data['costs_oncarriage_currency'] . "',
			qtwarsell= '" . $this->session->data['qtwarsell'] . "',
			qtwarcost= '" . $this->session->data['qtwarcost'] . "',
			qtportconcost= '" . $this->session->data['qtportconcost'] . "',
			qtcostpc= '" . $this->session->data['truckingrate_min'] . "',
			qtcostins= '" . $this->session->data['qtcostins'] . "',
			qtcostinout= '" . $this->session->data['qtcostinout'] . "',
			qtcostpallet= '" . $this->session->data['qtcostpallet'] . "',
			qtcostseg= '" . $this->session->data['qtcostseg'] . "',
			qtcostother= '" . $this->session->data['qtcostother'] . "',
			qtcostothtest= '" . $this->session->data['qtcostothtest'] . "',
			qtcosthaz= '" . $this->session->data['qtcosthaz'] . "',
			qtcostps= '" . $this->session->data['qtcostps'] . "',
			qtcreate= '" . $this->session->data['qtcreate'] . "',
			qtthccostr= '" . $this->session->data['qtthccostr'] . "',
			qtthccostm= '" . $this->session->data['qtthccostm'] . "',
			qtdestdcost= '" . $this->session->data['costs_destdocs_quote'] . "',
			qtcustccost= '" . $this->session->data['costs_customsclearance_quote'] . "',
			qtthcosttot= '" . $this->session->data['costs_thc2_quote'] . "',
			qtdesc4cost= '" . $this->session->data['qtdesc4cost'] . "',
			qtbademail= '" . $this->session->data['qtbademail'] . "',
			qttrktt= '" . $this->session->data['truckingdays'] . "',
			qtsales= '" . $this->session->data['qtsales'] . "',
			qtcorf= '" . $this->session->data['qtcorf'] . "',
			qtpalletcost= '" . $this->session->data['qtpalletcost'] . "',
			qtshowdestc= '" . $this->session->data['qtshowdestc'] . "',
			qtshowcft= '" . $this->session->data['qtshowcft'] . "',
			qtlhfuel= '" . $this->session->data['qtlhfuel'] . "',
			qtlhtype= '" . $this->session->data['qtlhtype'] . "',
			qtdestchgtext= '" . $this->session->data['qtdestchgtext'] . "',
			qtdestchgamt= '" . $this->session->data['costs_destcharges_quote'] . "',
			qtapptrqd= '" . $this->session->data['pickupappt'] . "',
			qtbtob= '" . $this->session->data['qtbtob'] . "',
			qtholdtruck= '" . $this->session->data['qtholdtruck'] . "',
			qtcustref= '" . $this->session->data['customerref'] . "',
			qtsalesemail=	'" . $this->session->data['cpytosalesrep'] . "'	,
  	        qtlhrate= 	'" . $this->session->data['rates_line_haul'] . "'	,
			qtlhmin=	'" . $this->session->data['rates_line_haul_min'] . "',
			qtdestcode = '" . $this->session->data['qtdestcode'] . "'

		ON DUPLICATE KEY UPDATE

			`QtDisp`= '" . $this->session->data['qtstatus']. "',
			QtBL= '" . $this->session->data['QtBL'] . "',
			QtFCurr= '" . $this->session->data['QtFCurr'] . "',
			`QtDate`= '" . $this->session->data['quotedate']. "',
			`QtCust`= '" . $this->session->data['customer']. "',
		";

		if(isset($this->session->data['routedcargo']) && $this->session->data['routedcargo'] == 'true'){
				$sql  .="
				QtCustomer= concat('" .$this->db->escape($this->session->data['customerName']) ."','\n','S/'
				'" .$this->db->escape($this->session->data['customerSignator']) ."','\n','C/',
				'". $this->db->escape($this->session->data['customerConsignee'])."','\n','N/',
				'". $this->db->escape($this->session->data['customerNotify'])."' ),"	;
		}	else {
			$sql.=

				"`QtCustomer`= '" . $this->db->escape($this->session->data['customerdetail']). "',";
		}


			$sql.="
			`QtRcpt`= '" . $this->session->data['service_por']. "',
			";

		if(isset($this->session->data['email_to_send'])&& !empty($this->session->data['email_to_send'])){
			if (sizeof($this->session->data['email_to_send'])>'1'){
				for ($x = 0; $x < sizeof($this->session->data['email_to_send']); $x++) {
						$contacts[]=$this->session->data['email_to_send'][$x]['contact'];

					}
				for ($x = 0; $x < sizeof($this->session->data['email_to_send']); $x++) {
					$emails[]=$this->session->data['email_to_send'][$x]['email'];

				}

				$contact = implode(",",$contacts);
				$email =  implode(",",$emails);

				$sql .="qtemail= '" . $email. "',
					    QtCont= '" . $contact . "',
					";

			} else{
				$sql .="qtemail= '" . $this->session->data['email_to_send'][0]['email']. "',
					QtCont= '" . $this->session->data['email_to_send'][0]['contact'] . "',
					";
			}
		} else{
			$sql .="qtemail= null,
					QtCont= null,	";
		}
			$sql  .="
			`QTPhon`= '" . $this->session->data['custtelephone']. "',
			`QTFax`= '" . $this->session->data['custfax']. "',
			`QTBy`= '" . $this->session->data['quoteby']. "',
			`QtExp`='". $this->session->data['day_to_expire']. "',
			`qtorig`= '" . $this->session->data['service_portofloading_code']. "',
			`qtdest`= '" . $this->session->data['service_portofdest_code']. "',
			 qtem = '" . $this->session->data['commodity_measure']. "',
			`qtpcs`= '" . $this->session->data['commodity_pieces']. "',
			`qtpkg`= '" . $this->session->data['commodity_package_type']. "',
			qtwgte=  '" . round($this->session->data['commodity_lbs'],0) . "',
			qtwgtm=  '" . round($this->session->data['commodity_kg'],1) . "',
			qtcube= '" . round($this->session->data['commodity_cft'],0) . "',
			qtcubm='" . round($this->session->data['commodity_cbm'],3) . "',
			`qtcomm`= '" . $this->session->data['commodity']. "',
			`qtcarr`= '" . $this->session->data['carrier_code']. "',
			`qtfreq`= '" . $this->session->data['frequency']. "',
			`qttt`= '" . $this->session->data['transittime']. "',
			`qtcomments`= '" . $this->db->escape($this->session->data['qtcomments'])."\n".$this->db->escape($this->session->data['comments']). "',
			`qtPDOC`= '" . $this->session->data['service_pod']. "',
			qthaz= '".$this->session->data['hazardous']."',
			qtpereff='" . $this->session->data['personaleffects']. "',
			`qtzipcode`= '" . $this->session->data['service_zip']. "',
		    qttruckinfo ='" . $this->session->data['truckingpickup']. "',
			qttrucknotes = '" . $this->session->data['truckingshipid']. "',
			`qtcoload` = '".$this->session->data['qtcoload']."',

			qtpresell='" . $this->session->data['rates_precarriage'] . "',
			qtpresellmin='" . $this->session->data['rates_precarriage_min'] . "',
			qtofsell= '" . $this->session->data['rates_oceanfreight']. "',
			qtofsellmin= '" . $this->session->data['rates_oceanfreight_min']. "',
			qtthcsell= '" . $this->session->data['rates_thc']. "',
			qtthcsellmin= '" . $this->session->data['rates_thc_min']. "',
			qtbafsell= '" . $this->session->data['rates_baf']. "',
			qtbafsellmin= '" . $this->session->data['rates_baf_min']. "',
			qtfuel= '" . $this->session->data['rates_fuelsurcharge']. "',
			qtdestdocsell= '" . $this->session->data['rates_destdocs'] . "',
			qtblfeesell= '" . $this->session->data['rates_bolfee_min']. "',
			qtcclrsell = '" . $this->session->data['rates_customsclearance'] . "',
			qtwharfsell='" . $this->session->data['rates_aesfilingbytcl'] . "',
			qtoncarrsell= '" . $this->session->data['rates_oncarriage']. "',
			qtoncarrcost= '" . $this->session->data['costs_oncarriage_quote']. "',
			qtbrok= '" . $this->session->data['brokerage'] . "',
			qthazsell= '" . $this->session->data['rates_hazardous']. "',
			qthazsellmin= '" . $this->session->data['rates_hazardous_min']. "',
			qthazcost= '" . $this->session->data['rates_hazsurcharge_cost']. "',
			qthazcostmin= '" . $this->session->data['rates_hazsurcharge_cost_min']. "',
			qtportcongsell=  '" . $this->session->data['rates_docsreqd'] . "',
			qtwsch = '" . $this->session->data['rates_wgtsurcharge'] . "',
			qtprecost= '" . $this->session->data['truckingrate']. "',
			qtprecostmin= '" . $this->session->data['truckingrate_min']. "',
			qtchass= '" . $this->session->data['rates_chassissurcharge']. "',
			qtresid = '" . $this->session->data['pickuppresidentialpu'] . "',
			qtliftgate = '" . $this->session->data['pickupliftgate'] . "',
			qtexlen = '" . $this->session->data['pickupexcesslen'] . "',
			qteufee= '" .$this->session->data['rates_eufilingfee_min'] . "',
			qtrouted= '" . $this->session->data['routedcargo'] . "',
			QTfaxFl= '" . $this->session->data['QTfaxFl'] . "',
			QtRE= '" . $this->session->data['QtRE'] . "',
			qtfree= '" . $this->session->data['notes_ops'] . "',
			qtratbasis1= '" . $this->session->data['qtratbasis1'] . "',
			qtopoint= '" . $this->session->data['qtopoint'] . "',
			qtdpoint= '" . $this->session->data['qtdpoint'] . "',
			qtforl= '" . $this->session->data['qtforl'] . "',
			qtshowcarr= '0',
			";

			if(isset($this->session->data['qtbookdate'])&& !empty($this->session->data['qtbookdate'])){
				$sql .="qtbookdate= '" . $this->session->data['qtbookdate'] . "',	";
			} else{
				$sql .="qtbookdate=null, ";
			}

			$sql  .="
			";

			if(isset($this->session->data['qtbook2date'])&& !empty($this->session->data['qtbook2date'])){
				$sql .="qtbook2date= '" . $this->session->data['qtbook2date'] . "',	";
			} else{
				$sql .="qtbook2date=null, ";
			}

			$sql  .="
			";

			if(isset($this->session->data['qtbook3date'])&& !empty($this->session->data['qtbook3date'])){
				$sql .="qtbook3date= '" . $this->session->data['qtbook3date'] . "',	";
			} else{
				$sql .="qtbook3date=null, ";
			}

			$sql  .="

			qtbooking= '" . $this->session->data['qtbooking'] . "',
			qtbooking2= '" . $this->session->data['qtbooking2'] . "',
			qtbooking3= '" . $this->session->data['qtbooking3'] . "',
			qtbooking4= '" . $this->session->data['qtbooking4'] . "',
			";

			if(isset($this->session->data['qtbook4date'])&& !empty($this->session->data['qtbook4date'])){
				$sql .="qtbook4date= '" . $this->session->data['qtbook4date'] . "',	";
			} else{
				$sql .="qtbook4date=null, ";
			}

			$sql  .="
			qtramp= '" . $this->session->data['qtramp'] . "',
			qtramporig= '" . $this->session->data['qtramporig'] . "',
			qtscac= '" . $this->session->data['qtscac'] . "',
			qtireq= '" . $this->session->data['qtireq'] . "',
			qtires= '" . $this->session->data['qtires'] . "',
			qtfcls= '" . $this->session->data['qtfcls'] . "',
			qtlcls= '" . $this->session->data['qtlcls'] . "',
			qttruck= '" . $this->session->data['qttruck'] . "',
			QtCustName= '" . $this->session->data['QtCustName'] . "',
			qtsrep= '" . $this->session->data['qtsrep'] . "',
			Qtwhfmin= '" . $this->session->data['Qtwhfmin'] . "',
			qtdesc1= '" . $this->session->data['qtdesc1'] . "',
			qtdesc2= '" . $this->session->data['entry_other2'] . "',
			qtdesc3= '" . $this->session->data['entry_other3'] . "',
			qtdesc4= '" . $this->session->data['entry_other4'] . "',
			qtdesc2sell= '" . $this->session->data['rates_other2'] . "',
			qtdesc3sell= '" . $this->session->data['rates_other3'] . "',
			qtdesc4sell= '" . $this->session->data['rates_other4'] . "',
			qtdesc2cost= '" . $this->session->data['costs_desc2cost_quote'] . "',
			qtdesc3cost= '" . $this->session->data['costs_desc3cost_quote'] . "',
			qtdesc5= '" . $this->session->data['qtdesc5'] . "',
			qtdoor= '" . $this->session->data['qtdoor'] . "',
			qtusage= '" . $this->session->data['qtusage'] . "',
			qtauto= '" . $this->session->data['qtauto'] . "',
			qtwcfm= '" . $this->session->data['qtwcfm'] . "',
			qtwsc= '" . $this->session->data['qtwsc'] . "',
			qtotxt= '" . $this->session->data['qtotxt'] . "',
			qtwharfcost= '" . $this->session->data['qtwharfcost'] . "',
			qtoncarrcurr= '" . $this->session->data['costs_oncarriage_currency'] . "',
			qtwarsell= '" . $this->session->data['qtwarsell'] . "',
			qtwarcost= '" . $this->session->data['qtwarcost'] . "',
			qtportconcost= '" . $this->session->data['qtportconcost'] . "',
			qtcostpc= '" . $this->session->data['truckingrate_min'] . "',
			qtcostins= '" . $this->session->data['qtcostins'] . "',
			qtcostinout= '" . $this->session->data['qtcostinout'] . "',
			qtcostpallet= '" . $this->session->data['qtcostpallet'] . "',
			qtcostseg= '" . $this->session->data['qtcostseg'] . "',
			qtcostother= '" . $this->session->data['qtcostother'] . "',
			qtcostothtest= '" . $this->session->data['qtcostothtest'] . "',
			qtcosthaz= '" . $this->session->data['qtcosthaz'] . "',
			qtcostps= '" . $this->session->data['qtcostps'] . "',
			qtcreate= '" . $this->session->data['qtcreate'] . "',
			qtthccostr= '" . $this->session->data['qtthccostr'] . "',
			qtthccostm= '" . $this->session->data['qtthccostm'] . "',
			qtdestdcost= '" . $this->session->data['costs_destdocs_quote'] . "',
			qtcustccost= '" . $this->session->data['costs_customsclearance_quote'] . "',
			qtthcosttot= '" . $this->session->data['costs_thc2_quote'] . "',
			qtdesc4cost= '" . $this->session->data['qtdesc4cost'] . "',
			qtbademail= '" . $this->session->data['qtbademail'] . "',
			qttrktt= '" . $this->session->data['truckingdays'] . "',
			qtsales= '" . $this->session->data['qtsales'] . "',
			qtcorf= '" . $this->session->data['qtcorf'] . "',
			qtpalletcost= '" . $this->session->data['qtpalletcost'] . "',
			qtshowdestc= '" . $this->session->data['qtshowdestc'] . "',
			qtshowcft= '" . $this->session->data['qtshowcft'] . "',
			qtlhfuel= '" . $this->session->data['qtlhfuel'] . "',
			qtlhtype= '" . $this->session->data['qtlhtype'] . "',
			qtdestchgtext= '" . $this->session->data['qtdestchgtext'] . "',
			qtdestchgamt= '" . $this->session->data['costs_destcharges_quote'] . "',
			qtapptrqd='" . $this->session->data['pickupappt'] . "',
			qtbtob= '" . $this->session->data['qtbtob'] . "',
			qtholdtruck= '" . $this->session->data['qtholdtruck'] . "',
			qtcustref= '" . $this->session->data['customerref'] . "',
			qtsalesemail=	'" . $this->session->data['cpytosalesrep'] . "'	,
			qtlhrate= 	'" . $this->session->data['rates_line_haul'] . "'	,
			qtlhmin=	'" . $this->session->data['rates_line_haul_min'] . "',
			qtdestcode = '" . $this->session->data['qtdestcode'] . "'

					";

			$this->session->data['test_insert_quote_sync'] = $sql;

		$this->db->query($sql);
	}

	public function addTrucking(){
		$sql = "INSERT INTO `epspe_quotes_trucking` ";
		$sql .= "	set

				quote_id= '" . $this->session->data['quote_no']. "',
				truckinginfo ='" . $this->session->data['truckingpickup']. "',
				trucknotes = '" . $this->session->data['truckingshipid']. "',

		";
		if(isset($this->session->data['service_zip'])&& !empty($this->session->data['service_zip'])){$sql.="service_zip='".$this->session->data['service_zip']."',";} else{$sql .="service_zip=null, ";}
		if(isset($this->session->data['truckercontact'])&& !empty($this->session->data['truckercontact'])){$sql.="truckercontact='".$this->session->data['truckercontact']."',";} else{$sql .="truckercontact=null, ";}
		if(isset($this->session->data['truckertelephone'])&& !empty($this->session->data['truckertelephone'])){$sql.="truckertelephone='".$this->session->data['truckertelephone']."',";} else{$sql .="truckertelephone=null, ";}
		if(isset($this->session->data['truckerfax'])&& !empty($this->session->data['truckerfax'])){$sql.="truckerfax='".$this->session->data['truckerfax']."',";} else{$sql .="truckerfax=null, ";}
		if(isset($this->session->data['truckingemail'])&& !empty($this->session->data['truckingemail'])){$sql.="truckingemail='".$this->session->data['truckingemail']."',";} else{$sql .="truckingemail=null, ";}
		if(isset($this->session->data['pickupShipper'])&& !empty($this->session->data['pickupShipper'])){$sql.="pickup_shipper='".$this->session->data['pickupShipper']."',";} else{$sql .="pickup_shipper=null, ";}
		if(isset($this->session->data['pickupAddress'])&& !empty($this->session->data['pickupAddress'])){$sql.="pickup_address='".$this->session->data['pickupAddress']."',";} else{$sql .="pickup_address=null, ";}
		if(isset($this->session->data['pickupcontact'])&& !empty($this->session->data['pickupcontact'])){$sql.="pickup_contact='".$this->session->data['pickupcontact']."',";} else{$sql .="pickup_contact=null, ";}
		if(isset($this->session->data['pickuptelephone'])&& !empty($this->session->data['pickuptelephone'])){$sql.="pickup_telephone='".$this->session->data['pickuptelephone']."',";} else{$sql .="pickup_telephone=null, ";}
		if(isset($this->session->data['pickupfax'])&& !empty($this->session->data['pickupfax'])){$sql.="pickup_fax='".$this->session->data['pickupfax']."',";} else{$sql .="pickup_fax=null, ";}
		if(isset($this->session->data['pickupemail'])&& !empty($this->session->data['pickupemail'])){$sql.="pickup_email='".$this->session->data['pickupemail']."',";} else{$sql .="pickup_email=null, ";}
		if(isset($this->session->data['readydate'])&& !empty($this->session->data['readydate'])){$sql.="readydate='".$this->session->data['readydate']."',";} else{$sql .="readydate=null, ";}
		if(isset($this->session->data['bkpuspecinst'])&& !empty($this->session->data['bkpuspecinst'])){$sql.="pickup_specialinstruction='".$this->session->data['bkpuspecinst']."',";} else{$sql .="pickup_specialinstruction=null, ";}
		if(isset($this->session->data['pickupReceivingHrs'])&& !empty($this->session->data['pickupReceivingHrs'])){$sql.="pickup_receivinghrs='".$this->session->data['pickupReceivingHrs']."',";} else{$sql .="pickup_receivinghrs=null, ";}
		if(isset($this->session->data['truckingrate_min_profit'])&& !empty($this->session->data['truckingrate_min_profit'])){$sql.="min_profit='".$this->session->data['truckingrate_min_profit']."',";} else{$sql .="min_profit=null, ";}
		if(isset($this->session->data['truckingrate_markup'])&& !empty($this->session->data['truckingrate_markup'])){$sql.="markup='".$this->session->data['truckingrate_markup']."',";} else{$sql .="markup=null, ";}
		if(isset($this->session->data['truckingrate_max_profit'])&& !empty($this->session->data['truckingrate_max_profit'])){$sql.="max_profit='".$this->session->data['truckingrate_max_profit']."',";} else{$sql .="max_profit=null, ";}
		if(isset($this->session->data['truckingrate_per_effect'])&& !empty($this->session->data['truckingrate_per_effect'])){$sql.="personal_effects_rate='".$this->session->data['truckingrate_per_effect']."',";} else{$sql .="personal_effects_rate=null, ";}
		if(isset($this->session->data['rates_precarriage'])&& !empty($this->session->data['rates_precarriage'])){$sql.="precarriage_sell='".$this->session->data['rates_precarriage']."',";} else{$sql .="precarriage_sell=null, ";}
		if(isset($this->session->data['rates_precarriage_min'])&& !empty($this->session->data['rates_precarriage_min'])){$sql.="precarriage_sell_min='".$this->session->data['rates_precarriage_min']."',";} else{$sql .="precarriage_sell_min=null, ";}
		if(isset($this->session->data['truckingrate'])&& !empty($this->session->data['truckingrate'])){$sql.="precarriage_cost='".$this->session->data['truckingrate']."',";} else{$sql .="precarriage_cost=null, ";}

		if(isset($this->session->data['truckingrate_min'])&& !empty($this->session->data['truckingrate_min'])){$sql.="precarriage_cost_min='".$this->session->data['truckingrate_min']."'";} else{$sql .="precarriage_cost_min=null ";}


		$sql .= "ON DUPLICATE KEY UPDATE
		quote_id= '" . $this->session->data['quote_no']. "',
		date_added = now(),
		truckinginfo ='" . $this->session->data['truckingpickup']. "',
		trucknotes = '" . $this->session->data['truckingshipid']. "',

		";
	if(isset($this->session->data['service_zip'])&& !empty($this->session->data['service_zip'])){$sql.="service_zip='".$this->session->data['service_zip']."',";} else{$sql .="service_zip=null, ";}
		if(isset($this->session->data['truckercontact'])&& !empty($this->session->data['truckercontact'])){$sql.="truckercontact='".$this->session->data['truckercontact']."',";} else{$sql .="truckercontact=null, ";}
		if(isset($this->session->data['truckertelephone'])&& !empty($this->session->data['truckertelephone'])){$sql.="truckertelephone='".$this->session->data['truckertelephone']."',";} else{$sql .="truckertelephone=null, ";}
		if(isset($this->session->data['truckerfax'])&& !empty($this->session->data['truckerfax'])){$sql.="truckerfax='".$this->session->data['truckerfax']."',";} else{$sql .="truckerfax=null, ";}
		if(isset($this->session->data['truckingemail'])&& !empty($this->session->data['truckingemail'])){$sql.="truckingemail='".$this->session->data['truckingemail']."',";} else{$sql .="truckingemail=null, ";}
		if(isset($this->session->data['pickupShipper'])&& !empty($this->session->data['pickupShipper'])){$sql.="pickup_shipper='".$this->session->data['pickupShipper']."',";} else{$sql .="pickup_shipper=null, ";}
		if(isset($this->session->data['pickupAddress'])&& !empty($this->session->data['pickupAddress'])){$sql.="pickup_address='".$this->session->data['pickupAddress']."',";} else{$sql .="pickup_address=null, ";}
		if(isset($this->session->data['pickupcontact'])&& !empty($this->session->data['pickupcontact'])){$sql.="pickup_contact='".$this->session->data['pickupcontact']."',";} else{$sql .="pickup_contact=null, ";}
		if(isset($this->session->data['pickuptelephone'])&& !empty($this->session->data['pickuptelephone'])){$sql.="pickup_telephone='".$this->session->data['pickuptelephone']."',";} else{$sql .="pickup_telephone=null, ";}
		if(isset($this->session->data['pickupfax'])&& !empty($this->session->data['pickupfax'])){$sql.="pickup_fax='".$this->session->data['pickupfax']."',";} else{$sql .="pickup_fax=null, ";}
		if(isset($this->session->data['pickupemail'])&& !empty($this->session->data['pickupemail'])){$sql.="pickup_email='".$this->session->data['pickupemail']."',";} else{$sql .="pickup_email=null, ";}
		if(isset($this->session->data['readydate'])&& !empty($this->session->data['readydate'])){$sql.="readydate='".$this->session->data['readydate']."',";} else{$sql .="readydate=null, ";}
		if(isset($this->session->data['bkpuspecinst'])&& !empty($this->session->data['bkpuspecinst'])){$sql.="pickup_specialinstruction='".$this->session->data['bkpuspecinst']."',";} else{$sql .="pickup_specialinstruction=null, ";}
		if(isset($this->session->data['pickupReceivingHrs'])&& !empty($this->session->data['pickupReceivingHrs'])){$sql.="pickup_receivinghrs='".$this->session->data['pickupReceivingHrs']."',";} else{$sql .="pickup_receivinghrs=null, ";}
		if(isset($this->session->data['truckingrate_min_profit'])&& !empty($this->session->data['truckingrate_min_profit'])){$sql.="min_profit='".$this->session->data['truckingrate_min_profit']."',";} else{$sql .="min_profit=null, ";}
		if(isset($this->session->data['truckingrate_markup'])&& !empty($this->session->data['truckingrate_markup'])){$sql.="markup='".$this->session->data['truckingrate_markup']."',";} else{$sql .="markup=null, ";}
		if(isset($this->session->data['truckingrate_max_profit'])&& !empty($this->session->data['truckingrate_max_profit'])){$sql.="max_profit='".$this->session->data['truckingrate_max_profit']."',";} else{$sql .="max_profit=null, ";}
		if(isset($this->session->data['truckingrate_per_effect'])&& !empty($this->session->data['truckingrate_per_effect'])){$sql.="personal_effects_rate='".$this->session->data['truckingrate_per_effect']."',";} else{$sql .="personal_effects_rate=null, ";}
		if(isset($this->session->data['rates_precarriage'])&& !empty($this->session->data['rates_precarriage'])){$sql.="precarriage_sell='".$this->session->data['rates_precarriage']."',";} else{$sql .="precarriage_sell=null, ";}
		if(isset($this->session->data['rates_precarriage_min'])&& !empty($this->session->data['rates_precarriage_min'])){$sql.="precarriage_sell_min='".$this->session->data['rates_precarriage_min']."',";} else{$sql .="precarriage_sell_min=null, ";}
		if(isset($this->session->data['truckingrate'])&& !empty($this->session->data['truckingrate'])){$sql.="precarriage_cost='".$this->session->data['truckingrate']."',";} else{$sql .="precarriage_cost=null, ";}

		if(isset($this->session->data['truckingrate_min'])&& !empty($this->session->data['truckingrate_min'])){$sql.="precarriage_cost_min='".$this->session->data['truckingrate_min']."'";} else{$sql .="precarriage_cost_min=null ";}

		$sql .= "		";

		$this->session->data['test_trucking_insert'] = $sql;
		$this->db->query($sql);

	}
	public function addHistory($trkref, $trknote) {
		$Aluser = $this->user->getUsername();
		$LOG_TRACE_EVENT = '';
		$this->db->query("insert into eps_tracking_epspe_quote value( now(),'" . $trkref . "' , '" . $Aluser . "' , '" . $trknote . "', '" . $LOG_TRACE_EVENT . "')");
		$this->db->query("insert into eps_tracking_epspe_quote_temp value( now(),'" . $trkref . "' , '" . $Aluser . "' , '" . $trknote . "', '" . $LOG_TRACE_EVENT . "')");

	}

	public function getHistories($bkref, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("select trknote,trkstamp,trkby from eps_tracking_epspe_quote WHERE trkref ='" . $bkref . "' ORDER BY trkstamp DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

	public function getTotalHistories($bkref) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM eps_tracking_epspe_quote WHERE trkref = '" . (int)$bkref . "'");

		return $query->row['total'];
	}

	public function getQuote($quote_no) {
		$quote_query = $this->db->query("SELECT * FROM `epspe_quotes` WHERE QtNumb = '" . $quote_no . "'");

		if ($quote_query->num_rows) {
			return array(
			'QtNumb'		=>$quote_query->row['QtNumb'],
			'QtDisp'		=>$quote_query->row['QtDisp'],
			'QtBL'			=>$quote_query->row['QtBL'],
			'QtFCurr'		=>$quote_query->row['QtFCurr'],
			'QtDate'		=>$quote_query->row['QtDate'],
			'QtCust'		=>$quote_query->row['QtCust'],
			'QtCustomer'	=>$quote_query->row['QtCustomer'],
			'QtRcpt'		=>$quote_query->row['QtRcpt'],
			'QtCont'		=>$quote_query->row['QtCont'],
			'QTPhon'		=>$quote_query->row['QTPhon'],
			'QTFax'			=>$quote_query->row['QTFax'],
			'QTfaxFl'		=>$quote_query->row['QTfaxFl'],
			'QTBy'			=>$quote_query->row['QTBy'],
			'day_to_expire'=>$quote_query->row['QtExp'],
			'QtRE'=>$quote_query->row['QtRE'],
			'qtorig'=>$quote_query->row['qtorig'],
			'qtdest'=>$quote_query->row['qtdest'],
			'qtem'=>$quote_query->row['qtem'],
			'qtpcs'=>$quote_query->row['qtpcs'],
			'qtpkg'=>$quote_query->row['qtpkg'],
			'qtwgte'=>$quote_query->row['qtwgte'],
			'qtwgtm'=>$quote_query->row['qtwgtm'],
			'qtcube'=>$quote_query->row['qtcube'],
			'qtcubm'=>$quote_query->row['qtcubm'],
			'qtcomm'=>$quote_query->row['qtcomm'],
			'qtcarr'=>$quote_query->row['qtcarr'],
			'qtfreq'=>$quote_query->row['qtfreq'],
			'qttt'=>$quote_query->row['qttt'],
			'qtcomments'=>$quote_query->row['qtcomments'],
			'qtPDOC'=>$quote_query->row['qtPDOC'],
			'qtfree'=>$quote_query->row['qtfree'],
			'qtratbasis1'=>$quote_query->row['qtratbasis1'],
			'qtopoint'=>$quote_query->row['qtopoint'],
			'qtdpoint'=>$quote_query->row['qtdpoint'],
			'qtforl'=>$quote_query->row['qtforl'],
			'qthaz'=>$quote_query->row['qthaz'],
			'qtshowcarr'=>$quote_query->row['qtshowcarr'],
			'qtbooking'=>$quote_query->row['qtbooking'],
			'qtbookdate'=>$quote_query->row['qtbookdate'],
			'qtbook2date'=>$quote_query->row['qtbook2date'],
			'qtbook3date'=>$quote_query->row['qtbook3date'],
			'qtbooking2'=>$quote_query->row['qtbooking2'],
			'qtbooking3'=>$quote_query->row['qtbooking3'],
			'qtbooking4'=>$quote_query->row['qtbooking4'],
			'qtbook4date'=>$quote_query->row['qtbook4date'],
			'qtramp'=>$quote_query->row['qtramp'],
			'qtramporig'=>$quote_query->row['qtramporig'],
			'qtdestcode'=>$quote_query->row['qtdestcode'],
			'qtpereff'=>$quote_query->row['qtpereff'],
			'qtzipcode'=>$quote_query->row['qtzipcode'],
			'qtscac'=>$quote_query->row['qtscac'],
			'qtireq'=>$quote_query->row['qtireq'],
			'qtires'=>$quote_query->row['qtires'],
			'qtfcls'=>$quote_query->row['qtfcls'],
			'qtlcls'=>$quote_query->row['qtlcls'],
			'qttruck'=>$quote_query->row['qttruck'],
			'qttruckinfo'=>$quote_query->row['qttruckinfo'],
			'qttrucknotes'=>$quote_query->row['qttrucknotes'],
			'QtCustName'=>$quote_query->row['QtCustName'],
			'qtsrep'=>$quote_query->row['qtsrep'],
			'qtcoload'=>$quote_query->row['qtcoload'],
			'Qtwhfmin'=>$quote_query->row['Qtwhfmin'],
			'qtdesc1'=>$quote_query->row['qtdesc1'],
			'qtdesc2'=>$quote_query->row['qtdesc2'],
			'qtdesc3'=>$quote_query->row['qtdesc3'],
			'qtdesc4'=>$quote_query->row['qtdesc4'],
			'qtdesc5'=>$quote_query->row['qtdesc5'],
			'qtdoor'=>$quote_query->row['qtdoor'],
			'qtusage'=>$quote_query->row['qtusage'],
			'qtauto'=>$quote_query->row['qtauto'],
			'qtemail'=>$quote_query->row['qtemail'],
			'qtwsch'=>$quote_query->row['qtwsch'],
			'qtwcfm'=>$quote_query->row['qtwcfm'],
			'qtwsc'=>$quote_query->row['qtwsc'],
			'qtotxt'=>$quote_query->row['qtotxt'],
			'qtpresell'=>$quote_query->row['qtpresell'],
			'qtpresellmin'=>$quote_query->row['qtpresellmin'],
			'qtprecost'=>$quote_query->row['qtprecost'],
			'qtprecostmin'=>$quote_query->row['qtprecostmin'],
			'qtofsell'=>$quote_query->row['qtofsell'],
			'qtofsellmin'=>$quote_query->row['qtofsellmin'],
			'qtthcsell'=>$quote_query->row['qtthcsell'],
			'qtthcsellmin'=>$quote_query->row['qtthcsellmin'],
			'qtbafsell'=>$quote_query->row['qtbafsell'],
			'qtbafsellmin'=>$quote_query->row['qtbafsellmin'],
			'qtfuel'=>$quote_query->row['qtfuel'],
			'qtdestdocsell'=>$quote_query->row['qtdestdocsell'],
			'qtblfeesell'=>$quote_query->row['qtblfeesell'],
			'qtcclrsell'=>$quote_query->row['qtcclrsell'],
			'qtwharfsell'=>$quote_query->row['qtwharfsell'],
			'qtwharfcost'=>$quote_query->row['qtwharfcost'],
			'qtoncarrsell'=>$quote_query->row['qtoncarrsell'],
			'qtoncarrcost'=>$quote_query->row['qtoncarrcost'],
			'qtoncarrcurr'=>$quote_query->row['qtoncarrcurr'],
			'qtbrok'=>$quote_query->row['qtbrok'],
			'qtwarsell'=>$quote_query->row['qtwarsell'],
			'qtwarcost'=>$quote_query->row['qtwarcost'],
			'qthazsell'=>$quote_query->row['qthazsell'],
			'qthazsellmin'=>$quote_query->row['qthazsellmin'],
			'qthazcost'=>$quote_query->row['qthazcost'],
			'qthazcostmin'=>$quote_query->row['qthazcostmin'],
			'qtportcongsell'=>$quote_query->row['qtportcongsell'],
			'qtportconcost'=>$quote_query->row['qtportconcost'],
			'qtdesc2cost'=>$quote_query->row['qtdesc2cost'],
			'qtdesc2sell'=>$quote_query->row['qtdesc2sell'],
			'qtdesc3sell'=>$quote_query->row['qtdesc3sell'],
			'qtdesc3cost'=>$quote_query->row['qtdesc3cost'],
			'qtcostpc'=>$quote_query->row['qtcostpc'],
			'qtcostins'=>$quote_query->row['qtcostins'],
			'qtcostinout'=>$quote_query->row['qtcostinout'],
			'qtcostpallet'=>$quote_query->row['qtcostpallet'],
			'qtcostseg'=>$quote_query->row['qtcostseg'],
			'qtcostother'=>$quote_query->row['qtcostother'],
			'qtcostothtest'=>$quote_query->row['qtcostothtest'],
			'qtcosthaz'=>$quote_query->row['qtcosthaz'],
			'qtcostps'=>$quote_query->row['qtcostps'],
			'qtcreate'=>$quote_query->row['qtcreate'],
			'qtthccostr'=>$quote_query->row['qtthccostr'],
			'qtthccostm'=>$quote_query->row['qtthccostm'],
			'qtdestdcost'=>$quote_query->row['qtdestdcost'],
			'qtcustccost'=>$quote_query->row['qtcustccost'],
			'qtthcosttot'=>$quote_query->row['qtthcosttot'],
			'qtdesc4sell'=>$quote_query->row['qtdesc4sell'],
			'qtdesc4cost'=>$quote_query->row['qtdesc4cost'],
			'qtbademail'=>$quote_query->row['qtbademail'],
			'qtresid'=>$quote_query->row['qtresid'],
			'qtliftgate'=>$quote_query->row['qtliftgate'],
			'qtexlen'=>$quote_query->row['qtexlen'],
			'qttrktt'=>$quote_query->row['qttrktt'],
			'qteufee'=>$quote_query->row['qteufee'],
			'qtsales'=>$quote_query->row['qtsales'],
			'qtcorf'=>$quote_query->row['qtcorf'],
			'qtrouted'=>$quote_query->row['qtrouted'],
			'qtpalletcost'=>$quote_query->row['qtpalletcost'],
			'qtshowdestc'=>$quote_query->row['qtshowdestc'],
			'qtshowcft'=>$quote_query->row['qtshowcft'],
			'qtlhrate'=>$quote_query->row['qtlhrate'],
			'qtlhmin'=>$quote_query->row['qtlhmin'],
			'qtlhfuel'=>$quote_query->row['qtlhfuel'],
			'qtlhtype'=>$quote_query->row['qtlhtype'],
			'qtdestchgtext'=>$quote_query->row['qtdestchgtext'],
			'qtdestchgamt'=>$quote_query->row['qtdestchgamt'],
			'qtapptrqd'=>$quote_query->row['qtapptrqd'],
			'qtchass'=>$quote_query->row['qtchass'],
			'qtbtob'=>$quote_query->row['qtbtob'],
			'qtholdtruck'=>$quote_query->row['qtholdtruck'],
			'qtcustref'=>$quote_query->row['qtcustref']	,
			'qtagenemail'=>$quote_query->row['qtagenemail']

			);

		return $query->row;
		}
	}

	public function getWebQuote($quote_no) {
		$quote_query = $this->db->query("SELECT * FROM eps_website WHERE webid = '" . $quote_no . "'");

		if ($quote_query->num_rows) {
			$webquote =  array(
			'quotedate'			=>$quote_query->row['webdatetime'],
			'customerdetail'	=>$quote_query->row['webcust'],
			'webfname'			=>$quote_query->row['webfname'],
			'weblname'			=>$quote_query->row['weblname'],
			'custtelephone'		=>$quote_query->row['webphone'],
			'custemail'			=>$quote_query->row['webemail'],
			'qtorig'			=>$quote_query->row['weborg'],
			'qtdest'			=>$quote_query->row['webdest'],
			'webtype'			=>$quote_query->row['webtype'],
			'QtNumb'			=>$quote_query->row['webid'],
			'weemsent'			=>$quote_query->row['weemsent'],
			'customer'			=>$quote_query->row['webccode'],
			'webzip'			=>$quote_query->row['webzip'],
			'commodity_lbs'		=>$quote_query->row['webwgt'],
			'commodity_lbs'		=>$quote_query->row['webwgt'],
			'commodity_cft'		=>$quote_query->row['webcube'],
			'qtliftgate'		=>$quote_query->row['weblift'],
			'webrespu'			=>$quote_query->row['webrespu'],
			'webtrk'			=>$quote_query->row['webtrk'],
			'webscac'			=>$quote_query->row['webscac'],
			'webttt'			=>$quote_query->row['webttt'],
			'webcwtrate'		=>$quote_query->row['webcwtrate'],
			'webtrkmin'			=>$quote_query->row['webtrkmin'],
			'routedcargo'		=>$quote_query->row['webrouted'],
			'qtbrok'			=>$quote_query->row['webbrokind'],
			'qtshowdestc'		=>$quote_query->row['webshowdests'],
			'customerref'		=>$quote_query->row['webcustref']
			);

			return $webquote;
		}

	}

	public function getQuoteCosts($quote){
		$sql="select qtoncarrcost,qtdesc2cost,qtdesc3cost,qtthcosttot,qtdestdcost,qtdestchgtext,qtdestchgamt,qtcustccost,qtcosthaz from epspe_quotes where qtnumb ='".$quote."' ";

		$query = $this->db->query($sql);

		return $query->row;

	}

	public function getQuotes($data = array()) {

			$sql = "SELECT * FROM epspe_quotes ";

			$implode = array();
			$sql .= " WHERE QtNumb > '0'";

			if (!empty($data['filter_quotenumber'])) {
				$implode[] = "QtNumb LIKE '%" . $this->db->escape($data['filter_quotenumber']) . "%'";
			}

			if (isset($data['filter_customer_code']) && !is_null($data['filter_customer_code'])) {
				$implode[] = "QtCust LIKE '%" . $data['filter_customer_code'] . "%'";
			}

			if (isset($data['filter_date_added'])&& !is_null($data['filter_date_added'])) {
				$implode[] = "date(QtDate) = '" . $this->db->escape($data['filter_date_added']) . "'";
			}

			if (isset($data['filter_date'])&& !is_null($data['filter_date'])) {
				$implode[] = "date(QtDate) = '" . $this->db->escape($data['filter_date']) . "'";
			}

			if (isset($data['filter_date_added'])&& !is_null($data['filter_date_added'])) {
				$implode[] = "QtDate = '" . $this->db->escape($data['filter_date_added']) . "'";
			}

			if (isset($data['filter_sref']) && !is_null($data['filter_sref'])) {
				$implode[] = "Qtcomments LIKE '%" . $this->db->escape($data['filter_sref']) . "%'";
			}

			if (!empty($data['filter_bookedby']) && !is_null($data['filter_bookedby'])) {
				$implode[] = "QTBy LIKE '%" . $this->db->escape($data['filter_bookedby']) . "%'";
			}

			if (!empty($data['filter_origin_code']) && !is_null($data['filter_origin_code'])) {
				$implode[] = "qtorig LIKE '%" . $this->db->escape($data['filter_origin_code']) . "%'";
			}

			if (!empty($data['filter_destination_code']) && !is_null($data['filter_destination_code'])) {
				$implode[] = "qtdest LIKE '%" . $this->db->escape($data['filter_destination_code']) . "%'";
			}

			if (!empty($data['filter_commodity']) && !is_null($data['filter_commodity'])) {
				$implode[] = "qtcomm LIKE '%" . $this->db->escape($data['filter_commodity']) . "%'";}

			if (!empty($data['filter_status']) && !is_null($data['filter_status'])) {
				$implode[] = "QtDisp = '" . $data['filter_status'] . "'";
			}

			if (!empty($data['filter_valid']) && $data['filter_valid']=='true') {
				$implode[] = "date_add(QtDate, interval + QtExp Day) > now() ";
			}


		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}

		$sort_data = array(
				'quotenu',
				'customer',
				'date',
				'vessel',
				'orig',
				'dest',
				'commodity'

		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY QtDate";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " DESC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		$this->session->data['quotefilter'] = $sql;
		return $query->rows;
	}

	public function getValidQuoteCount($data = array()){
		$sql ="select count(*) as total from epspe_quotes where QtDisp != 'B' ";
		if (!empty($data['filter_date'])) {
			$sql .= " and date_add(QtDate, interval + QtExp Day) = '".$data['filter_date'] . "'";
		} else {
			$sql .= " and date_add(QtDate, interval + QtExp Day)> now() ";
		}


		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTotalQuotes($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX_APP . "quotes`";

		if (!empty($data['filter_order_status'])) {
			$implode = array();

			$order_statuses = explode(',', $data['filter_order_status']);

			foreach ($order_statuses as $order_status_id) {
				$implode[] = "order_status_id = '" . (int)$order_status_id . "'";
			}

			if ($implode) {
				$sql .= " WHERE (" . implode(" OR ", $implode) . ")";
			}
		} else {
			$sql .= " WHERE qtnumb > '0'";
		}

		if (!empty($data['filter_status'])) {
			$sql .= " AND qtdisp = '" . $data['filter_status'] . "'";
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND QtDate = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}
		if (isset($data['filter_date'])&& !is_null($data['filter_date'])) {
			$implode[] = "date(QtDate) = '" . $this->db->escape($data['filter_date']) . "'";
		}
		if (!empty($data['filter_date_since_added'])) {
			$sql .= " AND QtDate >= DATE('" . $this->db->escape($data['filter_date_since_added']) . "')";
		}

		if (!empty($data['filter_date_modified'])) {
			$sql .= " AND QtDate = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
		}

		if (!empty($data['filter_total'])) {
			$sql .= " AND total = '" . (float)$data['filter_total'] . "'";
		}

		if (!empty($data['filter_bookedby']) && !is_null($data['filter_bookedby'])) {
			$implode[] = "QTBy LIKE '%" . $this->db->escape($data['filter_bookedby']) . "%'";
		}

		$query = $this->db->query($sql);

		
		return $query->row['total'];
	}

	public function getWebQuotes($data = array()) {
		$sql = "select webid as QtNumb,webcust as QtCustomer,webdatetime as QtDate,weborg as qtorig,webdest as qtdest, webcustref as qtcomm from eps_website ";

		$implode = array();
		$sql .= " where webid >'0'";

		if (!empty($data['filter_quotenu'])) {
			$implode[] = "webid LIKE '%" . $this->db->escape($data['filter_quotenu']) . "%'";
		}

		if (isset($data['filter_customer']) && !is_null($data['filter_customer'])) {
			$implode[] = "webcust LIKE '%" . (int)$data['filter_customer'] . "'";
		}

		if (isset($data['filter_date'])&& !is_null($data['filter_date'])) {
			$implode[] = "webdatetime = '" . $this->db->escape($data['filter_date']) . "'";
		}

		if (!empty($data['filter_orig']) && !is_null($data['filter_orig'])) {
			$implode[] = "weborg LIKE '%" . $this->db->escape($data['filter_orig']) . "%'";
		}

		if (!empty($data['filter_dest']) && !is_null($data['filter_dest'])) {
			$implode[] = "webdest LIKE '%" . $this->db->escape($data['filter_dest']) . "%'";
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}

		$sort_data = array(
				'quotenu',
				'customer',
				'date',
				'vessel',
				'orig',
				'dest',
				'commodity'

		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY webdatetime";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " ASC";
		} else {
			$sql .= " DESC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		$this->session->data['webquotefilter'] = $sql;
		return $query->rows;
	}


	public function getQuoteTrucking($quote_no){
		$sql = "select * from epspe_quotes_trucking where quote_id =  '" . $quote_no . "'";
		$query = $this->db->query($sql);

		if($query->num_rows){
		return $query->row;
		} else{
		return false;
		}
	}


	public function getQuoteValidDate($quote_no) {
		$quote_query = $this->db->query("SELECT date_add(QtDate,interval QtExp day) as valid_date FROM `epspe_quotes` WHERE QtNumb = '" . $quote_no . "'");

		return $quote_query->row['valid_date'];
	}


	public function getQuoteList($data) {
		$sql = "SELECT QtNumb,QtDate,QtCustomer,QtCustName,QtCont,QTPhon,QTFax,qtemail,QtCust,qtcoload,qtpereff  FROM epspe_quotes";

		$implode = array();
		$sql .= " WHERE ADDDATE(QtDate,+(QtExp)) > '2013-01-1'";

		if (!empty($data['filter_name'])) {
			$implode[] = "QtNumb LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}

	$query = $this->db->query($sql);



	return $query->rows;
	}


	public function getQuoteList_w_web($data) {
		$sql = "select QtNumb,QtDate,QtCustomer,QtCustName,QtCont,QTPhon,QTFax,qtemail,QtCust,qtcoload,qtpereff from (
			    select QtNumb,QtDate,QtCustomer,QtCustName,QtCont,QTPhon,QTFax,qtemail,QtCust,qtcoload,qtpereff from epspe_quotes
				WHERE ADDDATE(QtDate,+(QtExp)) > '2013-01-1' ";
		$sql .= "AND QtNumb LIKE  '%" . $this->db->escape($data['filter_name']) . "%'";
		$sql .= "UNION 	select webid,webdatetime,webcust,webcust, concat(webfname,' ',weblname) as contact,webphone,webphone,webemail,webccode,webtype,webtype from eps_website
				where ADDDATE(webdatetime,(+30))>now() and webcust <>'' ";
		$sql .= "and webid like '%" . $this->db->escape($data['filter_name']) . "%'";
		$sql .=	") quotes";
		$query = $this->db->query($sql);


		return $query->rows;
	}

	public function getQuoteStatusDescription($data) {
		$booking_status = $this->db->query("SELECT BKSDesc as status FROM epspe_lbkstat where BKSCode = '" . $data . "'");

		return $booking_status->row['status'];
	}

	public function getLastQuotes($data) {
		$sql = "select CustName1,qtnumb, qtorig,qtdest,qtby from epspe_quotes
		join epspe_cust on (epspe_quotes.qtcust = epspe_cust.CustCode) where qtDisp = 'O'";

		$sort_data = array(
				'qtnumb',
				'CustName1',
				'qtorig',
				'qtdest',
				'qtby'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY qtdate";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
		}


	public function getCustomerDetail($data){

					$sql1 = "select SPLIT_STR(QtCustomer,'\n',1) as name,
			SPLIT_STR(QtCustomer,'\n',2) as address1,
			SPLIT_STR(QtCustomer,'\n',3) as address2,
			SPLIT_STR(SPLIT_STR(replace(QtCustomer,right(SPLIT_STR(QtCustomer,'\n',4),5),''),'\n',4),',',1) as city,
			right(SPLIT_STR(replace(QtCustomer,right(SPLIT_STR(QtCustomer,'\n',4),5),''),'\n',4),3) as state,
			right(SPLIT_STR(QtCustomer,'\n',4),5) as zip

			from epspe_quotes where qtnumb ='".$data."' ";

					$sql2 = "select SPLIT_STR(QtCustomer,'\n',1) as name,
			SPLIT_STR(QtCustomer,'\n',2) as address1,
			SPLIT_STR(replace(QtCustomer,',','\n'),'\n',3) as city,
			left(SPLIT_STR(replace(QtCustomer,',','\n'),'\n',4),3) as state,
			right(SPLIT_STR(replace(QtCustomer,',','\n'),'\n',4),5) as zip

			from epspe_quotes where qtnumb ='".$data."' ";

	$sql3 = "select SPLIT_STR(cast(QtCustomer as char(5000) CHARACTER SET utf8),'S/',1) as name,
			SPLIT_STR(replace(QtCustomer,'S/',''),'\n',2) as signator,
			SPLIT_STR(replace(QtCustomer,'C/',''),'\n',3) as consignee,
			SPLIT_STR(replace(QtCustomer,'N/',''),'\n',4) as notify
			from epspe_quotes where qtnumb ='".$data."' ";

			$address_test = $this->db->query("select right(SPLIT_STR(replace(QtCustomer,',','\n'),'\n',5),5) as test from epspe_quotes where QtNumb ='".$data."' ");
			$address_test2 = $this->db->query("SELECT LENGTH(QtCustomer) - LENGTH(REPLACE(QtCustomer, '\n', ''))+1 AS `test`
		from epspe_quotes where qtnumb ='".$data."' ");
			$routed_test =$this->db->query("select qtrouted from epspe_quotes where QtNumb ='".$data."' ");

			if ($routed_test->row['qtrouted']=='true'){
				$customer_query = $this->db->query($sql3);
				$this->session->data['customerName'] =$customer_query->row['name'];
				$this->session->data['customerSignator'] =$customer_query->row['signator'];
				$this->session->data['customerConsignee'] =$customer_query->row['consignee'];
				$this->session->data['customerNotify'] =$customer_query->row['notify'];

			}else{

			if ($address_test2->row['test'] == '3'){
					$detail_sql = $sql2;

					$customer_query = $this->db->query($detail_sql);

					$this->session->data['customerName'] = $customer_query->row['name'];
					$this->session->data['customerAddress1'] = $customer_query->row['address1'];
					$this->session->data['customerCity'] = $customer_query->row['city'];
					$this->session->data['customerState'] = $customer_query->row['state'];
					$this->session->data['customerZip'] = $customer_query->row['zip'];

					$this->session->data['customerdetail'] = $this->session->data['customerName']."\n".
							$this->session->data['customerAddress1']."\n".
							$this->session->data['customerCity'].",".
							$this->session->data['customerState']." ".
							$this->session->data['customerZip'];

					unset($this->session->data['customerAddress2']);

				}else{
					$detail_sql = $sql1;

					$customer_query = $this->db->query($detail_sql);

					$this->session->data['customerName'] = $customer_query->row['name'];
					$this->session->data['customerAddress1'] = $customer_query->row['address1'];
					$this->session->data['customerAddress2'] = $customer_query->row['address2'];
					$this->session->data['customerCity'] = $customer_query->row['city'];
					$this->session->data['customerState'] = $customer_query->row['state'];
					$this->session->data['customerZip'] = $customer_query->row['zip'];

					$this->session->data['customerdetail'] = $this->session->data['customerName']."\n".
							$this->session->data['customerAddress1']."\n".
							$this->session->data['customerAddress2']."\n".
							$this->session->data['customerCity'].", ".
							$this->session->data['customerState']." ".
							$this->session->data['customerZip'];

				}
			}
			$this->session->data['test_customerdetails'] =$sql3;
		}


	public function getTotalCountQuotes($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM `epspe_quotes` ";

		$implode = array();
		$sql .= " WHERE QtNumb > '0'";

		if (!empty($data['filter_quotenumber'])) {
			$implode[] = "QtNumb LIKE '%" . $this->db->escape($data['filter_quotenumber']) . "%'";
		}

		if (isset($data['filter_customer_code']) && !is_null($data['filter_customer_code'])) {
			$implode[] = "QtCust LIKE '%" . $data['filter_customer_code'] . "%'";
		}

		if (isset($data['filter_date_added'])&& !is_null($data['filter_date_added'])) {
			$implode[] = "date(QtDate) = '" . $this->db->escape($data['filter_date_added']) . "'";
		}
		if (isset($data['filter_date'])&& !is_null($data['filter_date'])) {
			$implode[] = "date(QtDate) = '" . $this->db->escape($data['filter_date']) . "'";
		}

		if (isset($data['filter_sref']) && !is_null($data['filter_sref'])) {
			$implode[] = "Qtcomments LIKE '%" . $this->db->escape($data['filter_sref']) . "%'";
		}

		if (!empty($data['filter_bookedby']) && !is_null($data['filter_bookedby'])) {
			$implode[] = "QTBy LIKE '%" . $this->db->escape($data['filter_bookedby']) . "%'";
		}

		if (!empty($data['filter_origin_code']) && !is_null($data['filter_origin_code'])) {
			$implode[] = "qtorig LIKE '%" . $this->db->escape($data['filter_origin_code']) . "%'";
		}

		if (!empty($data['filter_destination_code']) && !is_null($data['filter_destination_code'])) {
			$implode[] = "qtdest LIKE '%" . $this->db->escape($data['filter_destination_code']) . "%'";
		}

		if (!empty($data['filter_commodity']) && !is_null($data['filter_commodity'])) {
			$implode[] = "qtcomm LIKE '%" . $this->db->escape($data['filter_commodity']) . "%'";}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql);
		$this->session->data['test_quotelist'] =$sql;
		return $query->row['total'];
	}


}

?>
