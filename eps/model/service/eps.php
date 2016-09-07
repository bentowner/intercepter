<?php
/**
 * Page-level DocBlock
 */

/**
 *  Access to the Data layer specific to Bookings.
 *
 * @author Ben Towner
 * @name Eps - model - Service
 * @version 0.1
 * @package EPS - Demo
 *
 */
class ModelServiceEps extends Model {

	public function addBookingObject($data,$bknumber){
		$this->db->query("delete FROM eps_objects where object_description = 'Booking' and curtime()>'".$this->config->get('config_draft_time') ."'");

		if ($this->object->Booking($bknumber)!=='false'){
			$this->db->query("INSERT INTO eps_objects SET
					object_data = '". $this->db->escape($data) ."',
					object_ref = '". $bknumber ."' ,
					user_id = '" . $this->user->getId() . "' ,
					 object_description = 'Booking'

					"
			);
		}
	}

	public function releaseBookingObject($data){
		$this->db->query("delete FROM eps_objects where object_description = 'Booking' and curtime()>'".$this->config->get('config_draft_time') ."'");

		$this->db->query("delete from eps_objects where object_description = 'Booking' and object_ref = '" . $data . "'");

		return;
	}

	public function getBookingObjectData($data){
		$query = $this->db->query("SELECT * FROM eps_objects where object_description = 'Booking' and user_id ='" . $this->user->getId(). "'  and object_ref = '" . $data . "' ");

		return $query->rows;
	}


	public function getBookingObject($data){
		$this->db->query("delete FROM eps_objects where object_description = 'Booking' and curtime()>'".$this->config->get('config_draft_time') ."'");

		$query = $this->db->query("SELECT object_data FROM eps_objects where object_description = 'Booking'
				and user_id ='" . $this->user->getId(). "'  and object_ref = '" . $data . "' ");

		return $query->row['object_data'];
	}

	public function getBookingObjects(){
		$this->db->query("delete FROM eps_objects where object_description = 'Booking' and curtime()>'".$this->config->get('config_draft_time') ."'");

		$query = $this->db->query("SELECT object_ref,'7:00 p.m.' as time,DATE_FORMAT(date_add(timestamp,interval + 30 MINUTE),'%H:%i:%s') as endtime FROM eps_objects
		where object_description = 'Booking' and user_id ='" . $this->user->getId() . "' and SYSDATE() < date_add(timestamp,interval + 30 MINUTE)");

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
		$query= $this->db->query("SELECT DATE_FORMAT(date_add(timestamp, interval + 90 MINUTE),'%H:%i:%s') as endtime,'7:00 p.m.' as time from eps_objects where object_description ='Booking' and object_ref ='".$data."' ");
		return $query->row['time'];
	}
	public function totalBookingObjects(){
		$query = $this->db->query("SELECT count(*) as total FROM eps_objects where object_description = 'Booking' and user_id ='" . $this->user->getId() . "' ");

		return $query->row['total'];
	}

	/**
	 * Post activity needed to sync concurrent methods upon each transaction
	 */
	public function addTransaction($transaction){

		if ($transaction['custcalog']){
			$sql = "INSERT INTO `troyweb`.`epspe_transaction` (`transaction_id` ,`date_added` ,`type` ,`reference` ,`custcode` ,
					`custcalog` ,`custcclog` ,`custctlog` ,`sync`)
				VALUES (NULL , NOW( ) , '" . $this->session->data['transaction_type'] . "', '" . $this->session->data['bookingnumber'] . "', '" . $this->session->data['customer'] . "','". $transaction['custcalog'] ." ' ,'". $transaction['custcclog'] ." ' ,'". $transaction['custctlog'] ." ' ,NOW() );";

		}else {
		$sql = "INSERT INTO `troyweb`.`epspe_transaction` (`transaction_id` ,`date_added` ,`type` ,`reference` ,`custcode` ,`custdelq` ,
					`custcafax` ,`custcalog` ,`custccfax` ,`custcclog` ,`custctfax` ,`custctlog` ,`sync`)
				VALUES (NULL , NOW( ) , '" . $this->session->data['transaction_type'] . "', '" . $this->session->data['bookingnumber'] . "', '" . $this->session->data['customer'] . "', 'A' , NULL , NULL , NULL , NULL , NULL , NULL , NULL);";
		}
		$this->db->query($sql);

		$this->session->data['test_transaction'] = $sql;

	}


	public function addNote($customer_id, $comment) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "customer_history SET customer_id = '" . (int)$customer_id . "', comment = '" . $this->db->escape(strip_tags($comment)) . "', date_added = NOW()");
	}

	public function addHistory($trkref, $trknote) {
		$Aluser = $this->user->getUsername();
		$LOG_TRACE_EVENT = '';
		$this->db->query("insert into eps_tracking_epspe_booking value( now(),'" . $trkref . "' , '" . $Aluser . "' , '" . $trknote . "', '" . $LOG_TRACE_EVENT . "')");
		$this->db->query("insert into eps_tracking_epspe_booking_temp value( now(),'" . $trkref . "' , '" . $Aluser . "' , '" . $trknote . "', '" . $LOG_TRACE_EVENT . "')");

	}

	public function getBookingRotation($data){
		$sql = "select bkvrot,bkvseq,bkapl from epspe_book where bkref ='" . $data . "'";
		$query = $this->db->query($sql);

		return $query->row;

	}

	public function getHistories($bkref, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("select trknote,trkstamp,trkby from eps_tracking_epspe_booking WHERE trkref ='" . $bkref . "' ORDER BY trkstamp DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

	public function getTotalHistories($bkref) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM eps_tracking_epspe_booking WHERE trkref = '" . (int)$bkref . "'");

		return $query->row['total'];
	}

	public function getBookings($data = array()) {
				$sql = "SELECT BKRef,BkCust,BKdate,BkSref,BKVess,BkOrig,BkDest,BkComm,BkStat FROM epspe_book ";

			$implode = array();
			$sql .= " WHERE BkRef > '0'";

			if (!empty($data['filter_booking_id'])) {
				$implode[] = "BKRef LIKE '%" . $this->db->escape($data['filter_booking_id']) . "%'";
			}

			if (isset($data['filter_customer_code']) && !is_null($data['filter_customer_code'])) {
				$implode[] = "BkCust ='" . (int)$data['filter_customer_code'] ."'";
			}

			if (isset($data['filter_date_added']) && !is_null($data['filter_date_added'])) {
				$implode[] = "BKdate = '" . $this->db->escape($data['filter_date_added']) . "'";
			}

			if (isset($data['filter_sref']) && !is_null($data['filter_sref'])) {
				$implode[] = "BkSref LIKE '%" . $this->db->escape($data['filter_sref']) . "%'";
			}

			if (isset($data['filter_vessel']) && !is_null($data['filter_vessel'])) {
				$implode[] = "BKVess LIKE '%" . $this->db->escape($data['filter_vessel']) . "%'";
			}

			if (!empty($data['filter_origin_code']) && !is_null($data['filter_origin_code'])) {
				$implode[] = "BkOrig = '" . $data['filter_origin_code']. "'";
			}

			if (!empty($data['filter_destination_code']) && !is_null($data['filter_destination_code'])) {
				$implode[] = "BkDest = '" . $data['filter_destination_code'] . "'";
			}

			if (!empty($data['filter_commodity']) && !is_null($data['filter_commodity'])) {
				$implode[] = "BkComm LIKE '%" . $this->db->escape($data['filter_commodity']) . "%'";
			}

			if (!empty($data['filter_status'])) {
				$sql .= " AND BkStat = '" . $data['filter_status'] . "'";
			}

			if (!empty($data['filter_sameday']) && !is_null($data['filter_sameday'])) {
				$implode[] = "BkStat = 'O' and bkidd >= BkLDD and BkOrig = '" . $this->db->escape($data['filter_sameday']) . "'";
			}

			if (!empty($data['filter_open']) && !is_null($data['filter_open'])) {
				if ($data['filter_open']=='NONE'){
					$implode[] = "BkStat = 'O' ";
				} else{
					$implode[] = "BkStat = 'O' and BkOrig = '" . $this->db->escape($data['filter_open']) . "'";
				}
			}
			if (!empty($data['filter_received']) && !is_null($data['filter_received'])) {
				if ($data['filter_received']=='NONE'){
					$implode[] = "BkStat = 'R' ";
				} else{
					$implode[] = "BkStat = 'R' and BkOrig = '" . $this->db->escape($data['filter_received']) . "'";
				}
			}
			if (!empty($data['filter_sameday']) && !is_null($data['filter_sameday'])) {
					$implode[] = "BkStat = 'O' and bkidd >= BkLDD and BkOrig = '" . $this->db->escape($data['filter_sameday']) . "'";
			}
			if (!empty($data['filter_intransit']) && !is_null($data['filter_intransit'])) {
				$implode[] = "BkStat = 'R' and Bkapl != BkOrig and bkorig ='" . $this->db->escape($data['filter_intransit']) . "%'";
			}

			if (!empty($data['filter_bookedby']) && !is_null($data['filter_bookedby'])) {
				$implode[] = "BkUser LIKE '%" . $this->db->escape($data['filter_bookedby']) . "%'";
			}

			if ($implode) {
				$sql .= " AND " . implode(" AND ", $implode);
			}

			$sort_data = array(
					'BkRef',
					'BkCust',
					'BKdate',
					'BkSref',
					'BKVess',
					'BkOrig',
					'BkDest',
					'BkComm',
					'BkStat'

								);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY BkRef";
			}

			if (isset($data['order']) && ($data['order'] == 'ASC')) {
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


			return $query->rows;


		}

	public function getBookingCustomer($data=array()){
		$sql = "SELECT BkCust,BKdate,BkSref,BKVess,BkOrig,BkDest,BkComm,BkStat FROM epspe_book ";

		$implode = array();
		$sql .= " WHERE BkRef > '0'";

		if (!empty($data['filter_booking_id'])) {
			$implode[] = "BKRef = '" .$data['filter_booking_id'] . "'";
		}
		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}
		$query = $this->db->query($sql);
		return $query->row;

	}

	public function getBookingStatus($data = array()) {
		$booking_status = $this->db->query("SELECT BKSCode,BKSDesc FROM epspe_lbkstat");

		return $booking_status->rows;
	}

/* *
 *  Create query to retrieve rates dynamically based on criteria/conditions.
*
*/
	public function getBookingRate($data) {
		unset ($this->session->data['special_rates_oceanfreight']);
		unset ($this->session->data['special_rates_oceanfreight_min']);

		$sql = "SELECT title,rate,min,type,based,placeholder FROM eps_rate_rule as rule
				inner join eps_rate_class as class on class.rate_class_id = rule.rate_class
				inner join eps_rate_rate as rate on rule.rate_id = rate.rate_id
				WHERE dept_id='LCL'";

		// Effective Rate Timing
		if (!empty($data['service_ldt'])&& ($data['service_ldt']<>'')) {
			$lttodate= $this->db->query("select lttodate as rate_date from epspe_tt where lttorig = '" .$data['origin']. "' and lttdest = '" .$data['destination']. "'");
			$time = strtotime($lttodate->row['rate_date']);
			$time2 = $data['service_ldt'];

			$effectiveDate = date('Y-m-d',$time);
			$serviceDate = date('Y-m-d',$time2);

			if ($data['service_ldt'] < $effectiveDate){
				$sql .= " AND based = 'Time'";
			}else{
				$sql .= " AND based = 'Service'";
			}
		}

		// Service Selection
		if (!empty($data['origin']) && ($data['origin']<>'') ) {
			if (!empty($data['destination']) && ($data['destination']<>'') ) {

			$sql .= " AND geo_origin_id = '" . $data['origin']. "'";
			$sql .= " AND geo_dest_id = '" . $data['destination']. "'";
			}
		}

	   // Customer Type
		if (!empty($data['customer'])) {

			$custcladjSQL = "select CustcType,custcladj,custcfact,custaddon,custaddtyp,custaddaamt from epspe_cust where custcode = '" . $data['customer']. "' ";
			$query = $this->db->query($custcladjSQL);

			$customerType = $query->row['CustcType'];
			$custcladj =  $query->row['custcladj'];
			$CustomerAdj= $query->row['custcladj'];
			$custcfact =  $query->row['custcfact'];
			$custaddon =  $query->row['custaddon'];


			$this->session->data['CustomerType']=$query->row['CustcType'];
			$this->session->data['CustomerAdj'] = $query->row['custcladj'];
			$this->session->data['custcfact']   = $query->row['custcfact'];

			// to-do Verify this will match to an array
			if ($customerType == 'P'){

				$sql .= " AND type LIKE 'C%'";


				$special_rate_query = $this->db->query($sql);

				if($custcfact=='D'){
					$this->session->data['special_rates_oceanfreight'] =($special_rate_query->row['rate']+ $query->row['custcladj']);
					$this->session->data['special_rates_oceanfreight_min'] = ($special_rate_query->row['min']+ $query->row['custcladj']) ;
				}else if($custcfact=='P'){
					$this->session->data['special_rates_oceanfreight'] =($special_rate_query->row['rate']+
							($special_rate_query->row['rate'] * ($query->row['custcladj']*.01)));
					$this->session->data['special_rates_oceanfreight_min'] = ($special_rate_query->row['min']+
							($special_rate_query->row['min'] * ($query->row['custcladj']*.01)));
				}

		    }else if ($customerType == 'D'){
				$sql .= " AND type LIKE 'C%'";


				$special_rate_query = $this->db->query($sql);

				if($custcfact=='D'){
					$this->session->data['special_rates_oceanfreight'] =($special_rate_query->row['rate']- $query->row['custcladj']);
					$this->session->data['special_rates_oceanfreight_min'] = ($special_rate_query->row['min']- $query->row['custcladj']) ;
				}else if($custcfact=='P'){
					$this->session->data['special_rates_oceanfreight'] =($special_rate_query->row['rate']-
							($special_rate_query->row['rate'] * ($query->row['custcladj']*.01)));
					$this->session->data['special_rates_oceanfreight_min'] = ($special_rate_query->row['min']-
							($special_rate_query->row['min'] * ($query->row['custcladj']*.01)));
				}

			} else {
		// Booking type
				if (!empty($data['Bkcold']) && ($data['Bkcold']<>'') ) {

					if($data['personaleffects'] == 'true'){
						$sql .= " AND type LIKE 'P%'";
					}else{
						$sql .= " AND type LIKE '" . $data['Bkcold']. "%'";
					}
				}
			}

		}

	//Customer Specific
		$cust_specific = "select custspecrate as customer_special from epspe_cust where custcode = '" . $data['customer']. "' ";
		$cust_query = 	$this->db->query($cust_specific);
		if (!empty($cust_query->row['customer_special'])){
			/**
			 *  @todo - Replace this method of obtaining special rates to use the Rates Structure.
			 */

			$cust_special_rate = $this->getSpecialRateItems($data['customer']);

			$this->session->data['special_rate_test'] = $cust_special_rate ;

			$i = sizeof($cust_special_rate);

			foreach($cust_special_rate as $item){
				if (in_array($data['origin'],$item)){
					if (in_array($data['destination'],$item)){
						$rate = $item['Rate'];
						$min = $item['Min'];
						$rounded = str_replace('.00', '', $rate);
						$rate_round =preg_replace("/[^0-9]/","",$rounded);
						$rounded_min = str_replace('.00', '', $min);
						$min_round = preg_replace("/[^0-9]/","",$rounded_min);
						$this->session->data['expire_test'] = new DateTime($item['expire']);
						$expire = new DateTime($item['expire']);
						if ($expire > new DateTime()){
							$this->session->data['special_rates_oceanfreight'] = $rate_round ;
							$this->session->data['special_rates_oceanfreight_min'] =  $min_round ;
							$this->session->data['special_rates_NoBLF'] = $item['NoBLF'];
							$this->session->data['special_rates_NoEUF'] = $item['NoEUF'];
							$this->session->data['special_rates_NoCSF'] = $item['NoCSF'];
							$this->session->data['special_rates_expire_date'] = $expire->format('Y-m-d');
							if ($item['hazrt']){$this->session->data['customer_haz_rate'] = $customer_haz_rate = 'true';}
							if ($item['hazmin']){$customer_haz_min = 'true';}
						}
					} else {

					$this->session->data['rates_oceanfreight'] = $item['Rate'];
					$this->session->data['rates_oceanfreight_min'] = $item['Min'];

					}
				}
			}



		}
	// ---end Customer / Booking type /
		// Routed :: Agent rates
		if ($data['routedcargo'] == 'true'){

			$this->load->model('maintenance/agents');
			$this->load->model('service/service');

			$agenquery = $this->model_service_service->getService($this->session->data['service_rotation']);

			$agencode = $this->model_maintenance_agents->getAgentRoutedRates($agenquery['vragt1']);

			if ($agencode['agenbaserates']=='true'){

				$rate = str_replace("AND geo_dest_id = '" . $data['destination'].  "'" ,"AND geo_dest_id = '" . $agencode['agenbase']. "'" ,$sql);

				$special_rate_query = $this->db->query($rate);

				$this->session->data['special_rates_oceanfreight'] =$special_rate_query->row['rate'] ;
				$this->session->data['special_rates_oceanfreight_min'] = $special_rate_query->row['rate'] ;

			}

			if ($agencode['agenroutmark']=='true'){
				$this->session->data['service_baseport'] = $baseport = $this->session->data['service_detail']['vrunlo'];

				if ($agencode['agenratype']=='B' ){
					if ($baseport == $data['destination']){
				$special_rate_query2 = $this->db->query($sql);

				$this->session->data['special_rates_oceanfreight'] =$special_rate_query2->row['rate'] + $agencode['agenrmarkamt'];
				$this->session->data['special_rates_oceanfreight_min'] = $special_rate_query2->row['rate'] + $agencode['agenrmarkamt'];
					}
				}

				if ($agencode['agenratype'] <>'B'){

					$special_rate_query2 = $this->db->query($sql);

					$this->session->data['special_rates_oceanfreight'] =$special_rate_query2->row['rate']+ $agencode['agenrmarkamt'];
					$this->session->data['special_rates_oceanfreight_min'] = $special_rate_query2->row['rate'] + $agencode['agenrmarkamt'];

				}

			}

		}

		// Routed :: Agent fees
		if ($data['routedcargo'] == 'true'){
			$this->load->model('maintenance/agents');
			$this->load->model('service/service');

			$agenquery = $this->model_service_service->getService($this->session->data['service_rotation']);

			$agencode = $this->model_maintenance_agents->getAgentRoutedRates($agenquery['vragt1']);
			$this->session->data['routed_test']= $agencode;
			//Doc fee

			if ($agencode['agendoc'] !==null){

				$sql .= " or (based = 'Agent' and rate_class_id = '18' and agent_id ='".$agenquery['vragt1']."') ";
			} else{
				$sql .= " or (rate_class_id = '17')";
			}


			//AES fee on Quotes only
			if ($this->session->data['transaction_type']=='Quote'){
				// Customer specific
				$customerspecific_aes ="select customer_id as customer FROM eps_rate_rule as rule inner join eps_rate_class as class on class.rate_class_id = rule.rate_class
						inner join eps_rate_rate as rate on rule.rate_id = rate.rate_id
						where type = 'AES' ";
				$customerspecific_query = $this->db->query($customerspecific_aes);

				$customerAesList=  array_column( $customerspecific_query->rows, 'customer');

				$this->session->data['customerAesList'] = $customerAesList;

					if ($agencode['agenaes'] !== null){
						$sql .= " or (based = 'Agent' and rate_class_id = '19' and agent_id ='".$agenquery['vragt1']."') ";
					} else if (in_array($data['customer'],$customerAesList)){
						$sql .= " or (based = 'Customer' and type='AES' and customer_id ='".$data['customer']."')";
					} else {
					$sql .= " or (rate_class_id = '19' and based = 'Administration') ";
				}
			}
		}




		// Destination specific
	// All in wrapper	rule.rule_id = '1'
		$All_in_query = $this->db->query("select destallin from eps_destads where DestCode = '".$data['destination']."' ");

		if ($All_in_query->row['destallin'] == 'true'){
			$baf_rule = "rule.rule_id = '9'";
		}else {
			$baf_rule = "rule.rule_id = '1'";
		}



		if (!empty($data['destination'])){
			$bafsql= "select count(*) from eps_destads as dest inner join eps_cntyads as country on country.cntycode = dest.destcnty where cntytierlist = cast(cntytierlist as CHAR)
						and (destnlcl='N' or destnlcl='L') and usedestlcl <> '1' and destcode = '".$data['destination']."'";
			$baflist = $this->db->query($bafsql);
			$destquery = "select destsail from eps_destads where destcode = '".$data['destination']."'";
			$destsail = $this->db->query($destquery);
			$destsail = $destsail->row['destsail'];
			// Destination Sail test
			if ($destsail =='true'){
				$sql .= " or (".$baf_rule." and based = 'Destination')";
			}else{

			// Tier Test
			if ($baflist > '0'){
				$tierquery = "select tier_number from eps_cntyads_tier where orig_tier = '".$data['viaOrigin']."' limit 1";
				$tierquery = $this->db->query($tierquery);
				$tier =  $tierquery->row['tier_number'];

				$baftime = "select cntybdt,cntybprv,cntyb2dat,cntyb2pdt,destsail from eps_destads as dest inner join eps_cntyads as country on
						country.cntycode = dest.destcnty where cntytierlist = cast(cntytierlist as CHAR) and destcode = '" . $data['destination']. "'";

				$bafquery = $this->db->query($baftime);

					if ($bafquery->num_rows){

					$bafdate1 = date($bafquery->row['cntybdt']);
					$bafdate2 = date($bafquery->row['cntybprv']);
					$bafdate3 = date($bafquery->row['cntyb2dat']);
					$bafdate4 = date($bafquery->row['cntyb2pdt']);


						if ($tier == '1'){

							if (date($data['service_ldt'])>= $bafdate1){
								$sql .= " or (".$baf_rule." and based = 'Destination_Tier1' and geo_dest_id = '" . $data['destination']. "'
								and odate = '$bafdate1')";
							} else
							if (date($data['service_ldt'])>= $bafdate2){

								$sql .= " or (rate_class_id = '3' and based = 'Destination_Tier1' and geo_dest_id = '" . $data['destination']. "'
								and odate = '$bafdate1')";
							}
						}

						if ($tierquery == '2'){

							if (date($data['service_ldt'])>= $bafdate3){

								$sql .= " or (".$baf_rule." and based = 'Destination_Tier2' and geo_dest_id = '" . $data['destination']. "'
								and odate = '$bafdate3')";

								}else
							if (date($data['service_ldt'])>= $bafdate4){

								$sql .= " or (".$baf_rule." and based = 'Destination_Tier2' and geo_dest_id = '" . $data['destination']. "'
								and odate = '$bafdate3')";
								}
							}
					}

				}

			}// end sail test

			$country_specific = "select cntygri1date,cntygri2date,cntygri1amt,cntygri2amt,cntylreq from eps_destads as dest inner join eps_cntyads as country on
						country.cntycode = dest.destcnty where cntytierlist = cast(cntytierlist as CHAR) and destcode = '" . $data['destination']. "'";

			$griquery = $this->db->query($country_specific);
			if ($griquery->num_rows){

			$cntygri1date = date($griquery->row['cntygri1date']);
			$cntygri2date = date($griquery->row['cntygri2date']);
			$cntygri1amount = $griquery->row['cntygri1amt'];
			$cntygri2amount = $griquery->row['cntygri2amt'];

				if ($cntygri1date <>'0'){

					if (date($data['service_ldt'])>= $cntygri1date){
						if ($cntygri1amount <>'0.0000'){
						$sql .= " or (rate_class_id = '16' and based = 'Destination_gri' and geo_dest_id = '" . $data['destination']. "' and odate = '$cntygri1date')";

						}
					}else if (date($data['service_ldt'])>= $cntygri2date){
						if ($cntygri2amount <>'0.0000'){
						$sql .= " or (rate_class_id = '16' and based = 'Destination_gri' and geo_dest_id = '" . $data['destination']. "' and odate = '$cntygri2date')";

						}
					}
				}
			}
			// Japan AFR
			$advance_file_query = $this->db->query($country_specific);

			if ($advance_file_query->row['cntylreq']=='true'){
				$sql .= " or (rate_class_id = '21')";
			}

			// In-Bond Requirement fee
			$innerbond = "select destibdirec as innerbond from eps_destads where destcode = '" . $data['destination']. "' ";
			$innerbond_query = $this->db->query($innerbond);

			if ($innerbond_query->row['innerbond']!== null){
				$sql .= " or (rate_class_id = '22' and type ='Direct IBond' AND geo_dest_id = '" . $data['destination']. "' )";
			}

		}

		// Chassis fee
		$RotationToDestination  = "select vreureq,vrchassis,vreufee from eps_vrotn where vrref = (select lttrot from epspe_tt where lttorig = '" . $data['origin']. "' and lttdest = '" . $data['destination']. "')";
		$RotationToDestinationquery = $this->db->query($RotationToDestination);
		$vrchassis = $RotationToDestinationquery->row['vrchassis'];
		$DestinationSpecific = "select desteureq,destnochassis,desthazrate,country.cntyhazr as countryhazr from eps_destads as dest inner join eps_cntyads as country on
					country.cntycode = dest.destcnty where destcode = '" . $data['destination']. "'";
		$DestinationSpecificquery = $this->db->query($DestinationSpecific);
		$destvrchassis = $DestinationSpecificquery->row['destnochassis'];
		$customerpreference = "select custnochassis,custrept,CustLRDt from epspe_cust where CustCode = '" . $data['customer']. "'";
		$customerpreferencequery = $this->db->query($customerpreference);
		$custchassis = $customerpreferencequery->row['custnochassis'];
		$custlsf = $customerpreferencequery->row['custrept'];
		$custlrdt = $customerpreferencequery->row['CustLRDt'];
		if ($vrchassis <>'0.0'){
			if ($destvrchassis !== 'true' || $destvrchassis == null ){
				if ($custchassis !== 'true' ){
					$sql .= " or (rate_class_id = '11')";
				}
			}
		}


	// All in wrapper
		$All_in_query = $this->db->query("select destallin from eps_destads where DestCode = '".$data['destination']."' ");

	// EU fee - vrotn vreureq or dest desteureq -> true
		$eufee1 = $DestinationSpecificquery->row['desteureq'];
		$eufee2 = $RotationToDestinationquery->row['vreufee'];

		if ($All_in_query->row['destallin'] == 'true'){
			if ($eufee1=='true' || $eufee2=='true'){
				$sql .= " or (rule.rule_id = '10')";
			}
		}else{
			if ($eufee1=='true' || $eufee2=='true'){
				$sql .= " or (rule.rule_id = '3')";
			}

		}

		// All in wrapper

		$quoteddate = $this->db->query("select timestamp(NOW()) as quotedate");
		$usedate = $quoteddate->row['quotedate'];

		if ($All_in_query->row['destallin'] == 'true'){
		// Administration fees - BL fee
			$sql .= " or (rule.rule_id = '9')";
		}else {
		// Administration fees - BL fee

			/**
			 * @todo - Remove this after 02/01/2015
			 */
			if ($data['service_ldt']  > '2015-02-01' && $this->session->data['transaction_type']!=='Quote'){
				if ($custlrdt <> ''){
					$sql .= "or (rate_class_id = '9' and type ='Administration' AND customer_id = '".$data['customer']."' )";
				} else {
					$sql .= " or (rule.rule_id = '18')";
				}

			} else {
					if ($this->session->data['transaction_type']=='Quote' && $usedate > '2015-01-15'){
						if ($custlrdt <> ''){
							$sql .= "or (rate_class_id = '9' and type ='Administration' AND customer_id = '".$data['customer']."' )";
						} else {
						$sql .= " or (rule.rule_id = '18')";
						}
					} else{
						if ($custlrdt <> ''){
							$sql .= "or (rate_class_id = '9' and type ='Administration' AND customer_id = '".$data['customer']."' )";
						} else {
							$sql .= " or (rule.rule_id = '2')";
						}
				}
			}
		}

		//Low Sulphur Surcharge

		if ($custlsf !== 'true' ){
			if ($data['service_ldt']  > '2015-02-01'){
				$sql .= " or (rule.rule_id = '19')";
			}
			if ($this->session->data['transaction_type']=='Quote' && $usedate > '2015-01-15'){
				$sql .= " or (rule.rule_id = '19')";
			}
		}

		// Hazardous surcharge
		$hazardousSpecific = "select cntyhazr,desthazrate from eps_cntyads as country inner join eps_destads as dest on
								country.cntycode = dest.destcnty  where destcode = '" . $data['destination']. "' ";
		$hazardousSpecificquery = $this->db->query($hazardousSpecific);

		$desthazrate = $hazardousSpecificquery->row['desthazrate'];
		$countryhazr = $hazardousSpecificquery->row['cntyhazr'];
		if ($data['hazardous']==='true'){
			if ( $customer_haz_rate == 'true' ){
				$sql .= "or (type = 'Hazardous' and geo_origin_id = '". $data['origin']."' and geo_dest_id = '". $data['destination']."' and customer_id = '". $data['customer']."' and based = 'Customer')";
			}else if ($desthazrate){
				$sql .= " or (rate_class_id = '4' and based = 'destination_haz' and geo_dest_id = '". $data['destination']."' )";
			}else if ($countryhazr){
				$sql .= " or (rate_class_id = '4' and based = 'country_haz' and geo_dest_id = '". $data['destination']."' )";
			}
		}

		//Line Haul
		$linehaul = "select origsrat as line_haul_rate from eps_origads where origcode =  '" . $data['origin']. "' ";
		$linehaulquery = $this->db->query($linehaul);

		if (($linehaulquery->num_rows) && $linehaulquery->row['line_haul_rate'] >0 ){
			$sql .= " or (rate_class_id = '20' and geo_origin_id = '". $data['origin']."' )";
		}


		$CountrySpecific = "select cntycode,Cntycusc,Cntyddoc from eps_destads as dest inner join eps_cntyads as country on
						country.cntycode = dest.destcnty where destcode = '" . $data['destination']. "'";
		$CountrySpecificquery = $this->db->query($CountrySpecific);

		// Brokerage Special
		if (isset($this->session->data['brokerage']) && $this->session->data['brokerage']=='true' ){

			if ($data['customer']=='228246' || $data['customer']=='005089'){
				$sql .= " or (rule.rule_id = '14') ";
			} else if ($data['customer']=='008054'){
				$sql .= " or (rule.rule_id = '15') ";
			} else {

				$CountryBrokerage = $CountrySpecificquery->row['cntycode'];

					if ($CountryBrokerage =='4120'){
					$sql .= " or (rule.rule_id = '13') ";
					} else {
					$sql .= " or (rule.rule_id = '12') ";
					}
			}
		}
		// Customs Clearance
		if($CountrySpecificquery->row['Cntycusc'] && $CountrySpecificquery->row['Cntycusc']<>0 ){
			$sql .= " or (rate_class_id = '12' and geo_dest_id = '". $data['destination']."' )";
		}

		// Destination Documents
		if($CountrySpecificquery->row['Cntyddoc'] && $CountrySpecificquery->row['Cntyddoc'] != null){
			$sql .= " or (rate_class_id = '8' and geo_dest_id = '". $data['destination']."' )";
		}

		$sql .= " order by priority desc";
		$query = $this->db->query($sql);

		$this->session->data['rates_info']=  $sql;

		return $query->rows;


	}

	public function getTotalStrategic($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX_APP . "engagement`";

		$implode = array();
		if (!empty($data['filter_status'])) {
			$status = array();

			$booking_statuses = explode(',', $data['filter_status']);

			foreach ($booking_statuses as $booking_status) {
				$status[] = "Type = '" . $booking_status . "'";
			}

			if ($status) {
				$sql .= " WHERE (" . implode(" OR ", $status) . ")";
			}
		} else {
			$sql .= " WHERE engagement_id > 0";

		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}

		if (isset($data['filter_date_added'])&& !is_null($data['filter_date_added'])) {
			$implode[] = "DateService = '" . $this->db->escape($data['filter_date_added']) . "'";
		}

		if (isset($data['filter_customer_code']) && !is_null($data['filter_customer_code'])) {
			$implode[] = "BkCust ='" . (int)$data['filter_customer_code'] ."'";
		}

		if (!empty($data['filter_origin_code']) && !is_null($data['filter_origin_code'])) {
			$implode[] = "BkOrig = '" . $data['filter_origin_code']. "'";
		}

		if (!empty($data['filter_destination_code']) && !is_null($data['filter_destination_code'])) {
			$implode[] = "BkDest = '" . $data['filter_destination_code'] . "'";
		}

		if (!empty($data['filter_open']) && !is_null($data['filter_open'])) {
			if ($data['filter_open']=='NONE'){
				$implode[] = "BkStat = 'O' ";
			} else{
				$implode[] = "BkStat = 'O' and BkOrig = '" . $this->db->escape($data['filter_open']) . "'";
			}
		}

		if (!empty($data['filter_received']) && !is_null($data['filter_received'])) {
			if ($data['filter_received']=='NONE'){
				$implode[] = "BkStat = 'R' ";
			} else{
				$implode[] = "BkStat = 'R' and BkOrig = '" . $this->db->escape($data['filter_received']) . "'";
			}
		}

		if (!empty($data['filter_sameday']) && !is_null($data['filter_sameday'])) {
			$implode[] = "BkStat = 'O' and bkidd >= BkLDD and BkOrig = '" . $this->db->escape($data['filter_sameday']) . "'";
		}

		if (!empty($data['filter_bookedby']) && !is_null($data['filter_bookedby'])) {
			$implode[] = "BkUser LIKE '%" . $this->db->escape($data['filter_bookedby']) . "%'";
		}

		if (!empty($data['filter_date_since_added'])&& !is_null($data['filter_date_since_added'])) {
			$sql .= " AND DateService >= DATE('" . $this->db->escape($data['filter_date_since_added']) . "')";
		}

		if (!empty($data['filter_date_modified'])) {
			$sql .= " AND DATE(bkdiscts) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
		}

		if (!empty($data['filter_total'])) {
			$sql .= " AND total = '" . (float)$data['filter_total'] . "'";
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTotalBookingByProcessingStatus() {
		$implode = array();

		$booking_statuses = $this->config->get('config_processing_status');

		foreach ($booking_statuses as $booking_status_id) {
			$implode[] = "booking_status_id = '" . (int)$booking_status_id . "'";
		}

		if ($implode) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX_APP. "book` WHERE " . implode(" OR ", $implode));

			return $query->row['total'];
		} else {
			return 0;
		}
	}

	public function getCustomerDetail($data){
		$sql1 = "select SPLIT_STR(BkCinf,'\n',1) as name,
	SPLIT_STR(BkCinf,'\n',2) as address1,
	SPLIT_STR(BkCinf,'\n',3) as address2,
	SPLIT_STR(SPLIT_STR(replace(BkCinf,right(SPLIT_STR(BkCinf,'\n',4),5),''),'\n',4),',',1) as city,
	right(SPLIT_STR(replace(BkCinf,right(SPLIT_STR(BkCinf,'\n',4),5),''),'\n',4),3) as state,
	right(SPLIT_STR(BkCinf,'\n',4),5) as zip

	from epspe_book where bkref ='".$data."' ";

		$sql2 = "select SPLIT_STR(BkCinf,'\n',1) as name,
	SPLIT_STR(BkCinf,'\n',2) as address1,
	SPLIT_STR(replace(BkCinf,',','\n'),'\n',3) as city,
	left(SPLIT_STR(replace(BkCinf,',','\n'),'\n',4),3) as state,
	right(SPLIT_STR(replace(BkCinf,',','\n'),'\n',4),5) as zip

	from epspe_book where bkref ='".$data."' ";

		$sql3 = "select SPLIT_STR(BkCinf,'\n',1) as name,
	SPLIT_STR(replace(BkCinf,'S/',''),'\n',2) as signator,
	SPLIT_STR(replace(BkCinf,'C/',''),'\n',3) as consignee,
	SPLIT_STR(replace(BkCinf,'N/',''),'\n',4) as notify
	from epspe_book where bkref ='".$data."' ";

		$address_test = $this->db->query("select right(SPLIT_STR(replace(BkCinf,',','\n'),'\n',5),5) as test from epspe_book where bkref ='".$data."' ");
		$address_test2 = $this->db->query("SELECT LENGTH(BkCinf) - LENGTH(REPLACE(BkCinf, '\n', ''))+1 AS `test`
		from epspe_book where bkref ='".$data."' ");

		$routed_test =$this->db->query("select bkrout from epspe_book where bkref ='".$data."' ");

		if ($routed_test->row['bkrout']=='true'){
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
	}

	public function getRateItems($data){

		$max = sizeof($data);

		$x=0;

		for ($x=0; $x<$max; $x++){

			$rate_array = $data[$x];
			foreach ($rate_array as $rate_item => $value) {

					if ($rate_array['placeholder'] == 'rates_oceanfreight') {
						$this->session->data['rates_oceanfreight'] = $rate_array['rate'] ;
						$data['rates_oceanfreight'] = $this->session->data['rates_oceanfreight'];
						$this->session->data['rates_oceanfreight_min'] = $rate_array['min'];
						$data['rates_oceanfreight_min'] = $this->session->data['rates_oceanfreight_min'];
					};

					if ($rate_array['placeholder']== 'rates_baf') {
						$this->session->data['rates_baf'] = $rate_array['rate'];
						$this->session->data['rates_baf_min'] = $rate_array['min'];
					};

					if ($rate_array['placeholder']== 'rates_hazardous') {
						$this->session->data['rates_hazardous'] = number_format($rate_array['rate'], 2, '.', '') ;
						$this->session->data['rates_hazardous_min'] = number_format($rate_array['min'], 2, '.', '') ;
					};

					if ($rate_array['placeholder']== 'rates_bolfee_min') {
						$this->session->data['rates_bolfee_min'] = number_format($rate_array['min'], 2, '.', '') ;
					};

					if ($rate_array['placeholder']== 'rates_aesfilingbytcl') {
						$this->session->data['rates_aesfilingbytcl'] = number_format($rate_array['min'], 2, '.', '') ;
					};

					if ($rate_array['placeholder']== 'rates_eufilingfee') {
						$this->session->data['rates_eufilingfee_min'] = $rate_array['min'];
					};

					if ($rate_array['placeholder']== 'rates_chassissurcharge') {
						$this->session->data['rates_chassissurcharge'] = $rate_array['rate'];
						$this->session->data['rates_chassissurcharge_min'] = $rate_array['min'];
					};

					if ($rate_array['placeholder']== 'rates_docsreqd') {
						$this->session->data['rates_docsreqd'] = $rate_array['min'];
					};

					if ($rate_array['placeholder']== 'rates_line_haul') {
						$this->session->data['rates_line_haul'] = $rate_array['rate'];
						$this->session->data['rates_line_haul_min'] = $rate_array['min'];
					};

					if ($rate_array['placeholder']== 'rates_brokerage_percentage') {
						$this->session->data['rates_brokerage_percentage_min'] = $rate_array['min'];
						$this->session->data['rates_brokerage_percentage'] = $rate_array['min'];
					};

					if ($rate_array['placeholder']== 'rates_other3') {
						$this->session->data['rates_other3'] = $rate_array['min'];
					};

					if ($rate_array['placeholder']== 'rates_other2') {
						$this->session->data['entry_other2'] = $rate_array['title'];
						$this->session->data['rates_other2'] = $rate_array['min'];
					};

			}
		}
	}

	public function getSpecialRateItems($data){

		$i_query = "SELECT SUM( LENGTH(custspecrate) - LENGTH(REPLACE(custspecrate, '\n', ''))+0) as special_count FROM epspe_cust where custcode = '".$data."'";
		$i_count = $this->db->query($i_query);
		$max = $i_count->row['special_count'];
		$specialrate = array();
		for ($x=1; $x<=$max; $x++){

		$special_rates_query = "select SPLIT_STR(replace(custspecrate,'\n','|'), '|', ((".$x ." - 1) *13)+1) as orig,
									   SPLIT_STR(replace(custspecrate,'\n','|'), '|', ((".$x ." - 1) *13)+3) as dest,
									   SPLIT_STR(replace(custspecrate,'\n','|'), '|', ((".$x ." - 1) *13)+5) as Rate,
									   SPLIT_STR(replace(custspecrate,'\n','|'), '|', ((".$x ." - 1) *13)+6) as Min,
									   SPLIT_STR(replace(custspecrate,'\n','|'), '|', ((".$x ." - 1) *13)+7) as NoBLF,
									   SPLIT_STR(replace(custspecrate,'\n','|'), '|', ((".$x ." - 1) *13)+8) as NoEUF,
									   SPLIT_STR(replace(custspecrate,'\n','|'), '|', ((".$x ." - 1) *13)+9) as NoCSF,
									   SPLIT_STR(replace(custspecrate,'\n','|'), '|', ((".$x ." - 1) *13)+10) as expire,
									   SPLIT_STR(replace(custspecrate,'\n','|'), '|', ((".$x ." - 1) *13)+11) as hazrt,
									   SPLIT_STR(replace(custspecrate,'\n','|'), '|', ((".$x ." - 1) *13)+12) as hazmin,
									   SPLIT_STR(replace(custspecrate,'\n','|'), '|', ((".$x ." - 1) *13)+13) as NoLSF
				               FROM epspe_cust where custcode = '".$data."'";

		$specialrate =  $this->db->query($special_rates_query);
		$specialrates[$x] = $specialrate->row;

		}

		return $specialrates ;
		/*
		 * @todo: Add parse for Expiration Date for Customer Special Rate Rules
		 *
		 */

	}

	public function getCustomerOFAlwaysRate($data){
		$sql = "SELECT title,rate,min,type,based,placeholder FROM eps_rate_rule as rule
				inner join eps_rate_class as class on class.rate_class_id = rule.rate_class
				inner join eps_rate_rate as rate on rule.rate_id = rate.rate_id
				WHERE dept_id='LCL'";

		// Effective Rate Timing
		if (!empty($data['service_ldt'])&& ($data['service_ldt']<>'')) {
			$lttodate= $this->db->query("select lttodate from epspe_tt where lttorig = '" .$data['origin']. "' and lttdest = '" .$data['destination']. "'");
			if ($data['service_ldt']> $lttodate){
				$sql .= " AND based = 'Time'";
			}else{
				$sql .= " AND based = 'Service'";
			}
		}

		// Service Selection
		if (!empty($data['origin']) && ($data['origin']<>'') ) {
			if (!empty($data['destination']) && ($data['destination']<>'') ) {

			$sql .= " AND geo_origin_id = '" . $data['origin']. "'";
			$sql .= " AND geo_dest_id = '" . $data['destination']. "'";
			}
		}

		// Booking type
				if (!empty($data['Bkcold']) && ($data['Bkcold']<>'') ) {

					if($data['personaleffects'] == 'true'){
						$sql .= " AND type LIKE 'P%'";
					}else{
						$sql .= " AND type LIKE '" . $data['Bkcold']. "%'";
					}
				}

		$query = $this->db->query($sql);

		return $query->row['rate'];
	}

	public function getRequirements($data){
		// replace procedure checkreqs on NVO
		$sql = "select country.cntywarr as cnty_war,
				dest.destwar as dest_war,
				country.cntywart as cnty_wart,
				country.cntyddoc as cnty_ddoc,
				dest.destdocs as dest_docs,
				country.cntydisc as cnty_disc,
				country.cntynope as cnty_nope,
				dest.destnope as dest_nope,
				country.cntypepl as cnty_pepl,
				country.cntypeci as cnty_peci,
			 	country.cntylreq cnty_lreq,
				country.cntywood as cnty_wood,
				country.cntycoll as cnty_coll,
				country.cntyhazt as cnty_hazt,
				dest.destnohaz as dest_nohaz,
				country.cntyblcl as cnty_blcl,
				country.cntycorq as cnty_corq,
				country.cntycirq as cnty_cirq,
				country.cntyplrq as cnty_plrq,
				country.cntyinsp as cnty_insp,
				country.cntyfri as cnty_fri,
				country.cntylres as cnty_lres,
				country.cntypoen as cnty_poen,
				dest.destdisc as dest_disc,
				country.cntypoec as cnty_poec,
				dest.destcca as dest_cca,
				dest.destcpod as dest_cpod,
				dest.useedestfcl as useedestfcl,
				country.cntypall as cnty_pall,
				dest.desteureq as desteureq
				from  eps_cntyads as country
				inner join eps_destads as dest on dest.destcnty = country.cntycode
				where dest.destcode = '" . $data . "' ";
		$query = $this->db->query($sql);

		return $query->row;

	}

	public function getNotes($data){


		$max_query = $this->db->query("SELECT ROUND ( (LENGTH(bkopsnotes) - LENGTH( REPLACE ( bkopsnotes, '--------------------------------', '') ) ) / LENGTH('--------------------------------')
   								 ) AS count FROM epspe_book where  bkref ='" . $data . "' ");

		$max = $max_query->row['count'];

		$this->session->data['opsnotes_count'] = $max;
		$ops_notes=array();
		for ($x=1; $x<=$max; $x++){

		$ops_notes_query = "select SPLIT_STR(replace(bkopsnotes,'--------------------------------','|'),'|',".$x .") as notes from epspe_book where bkref = '".$data."'";

		$ops_notes_list =  $this->db->query($ops_notes_query);
		$ops_notes[$x] = $ops_notes_list->row['notes'];

		}

		return $ops_notes;
	}


	public function getDecAES_list($data = array()) {
		$DecAES_list = $this->db->query("SELECT EXCode, EXDesc FROM epspe_exdeccntl");

		return $DecAES_list->rows;
	}

	public function getDecAES_name($data) {
		$DecAES_list = $this->db->query("SELECT EXDesc AS name FROM epspe_exdeccntl where EXCode = '" . $data . "'");

		return $DecAES_list->rows;
	}

	public function getBookingStatusDescription($data) {
		$booking_status = $this->db->query("SELECT BKSDesc FROM epspe_lbkstat where BKSCode = '" . $data . "'");

		return $booking_status->row['BKSDesc'];
	}

	public function getTruckingShipper($booking_no){
		$sql="select SPLIT_STR(bkloc,'\n',1) as name, SPLIT_STR(bkloc,'\n',2) as address,(LENGTH(bkloc) - LENGTH(REPLACE(bkloc, '\n', ''))+1) AS count
			 from epspe_book WHERE bkref = '" . $booking_no . "'";

		//  cast(concat(bkpuspecinst,replace(REPLACE(bkloc, '|', ''),substring_index(REPLACE(bkloc, '|', ''), '\n',4),'')) AS CHAR(1000) CHARACTER SET utf8) as thi

		$query =  $this->db->query($sql);
		return $query->row;

	}

	public function getTruckingShipperInfo($booking_no){

		$sql = "select cast(concat(bkpuspecinst,replace(REPLACE(bkloc, '|', ''),substring_index(REPLACE(bkloc, '|', ''), '\n',4),'')) AS CHAR(1000) CHARACTER SET utf8) as thi
			 	from epspe_book where bkref = '" . $booking_no . "'";
		$query =  $this->db->query($sql);
		return $query->row['thi'];
	}

	public function getTruckingShipper_info(){
		$sql = "select SPLIT_STR(bkloc,'\n',1) as name, SPLIT_STR(bkloc,'\n',2) as address, (LENGTH(bkloc) - LENGTH(REPLACE(bkloc, '\n', ''))+1) AS count,
				cast(concat(bkpuspecinst,replace(REPLACE(bkloc, '|', ''),substring_index(REPLACE(bkloc, '|', ''), '\n',4),'')) AS CHAR(1000) CHARACTER SET utf8) as thi
 				from epspe_book WHERE bkref ='" . $booking_no . "'";
		$query =  $this->db->query($sql);
		return $query->row;

	}

	public function getArrivalDetails($data){
		$query = $this->db->query("select RDVAL from epspe_rawfld as data inner join eps_rdtf as fields on data.rdfld = fields.rdfid
				  where rdref = '" . $data['bookingnumber']. "' and RDFRaw = 'bkxarr'");

		if($query->num_rows){

		$receipts= $query->rows;

		$this->session->data['receipts_test']=$receipts;

		$count = $this->db->query("select count(*) as total from epspe_rawfld as data inner join eps_rdtf as fields on data.rdfld = fields.rdfid
				  where rdref = '" . $data['bookingnumber']. "' and RDFRaw = 'bkxarr'");

		$count = $count->row['total'];

		$arrivaldetail = array();

		for ($x=0; $x<=$count; $x++){

			foreach ($receipts[$x] as $receipt) {
				$receiptdetail= $this->arrival->getReceipt($receipt);
				array_push($arrivaldetail, $receiptdetail);
			}
		}

		return $arrivaldetail;
		}
		return false;
	}

	public function getArrivals($data){

		$arrivalsql = "SELECT arrwhse as warecode,arrwght as weight FROM `epspe_arrivals` WHERE `Arrcode` = '" . $data['receipt']. "' ";
		$arrivalquery = $this->db->query($arrivalsql);

		$warecode = $arrivalquery->row['warecode'];
		$weight = $arrivalquery->row['weight'];
		$warehousequery = $this->db->query("SELECT warename1 FROM eps_ware where warecode ='" . $warecode. "' limit 1");
		$warehouse = $warehousequery->row['warename1'];

		$pcssql = "select rdval as pcs from epspe_rawfld as data inner join eps_rdtf as fields on data.rdfld = fields.rdfid
				where rdref = '" . $data['receipt']. "' and rdfld = '5' ";
		$pcsquery = $this->db->query($pcssql);
		$pcs = $pcsquery->row['pcs'];

		// Count item array
		$countsql = "select distinct rditm1 as item from epspe_rawfld as data inner join eps_rdtf as fields on data.rdfld = fields.rdfid
				  where rdref = '" . $data['receipt']. "' order by rditm1 desc limit 1";
		$countquery = $this->db->query($countsql);
		if ($countquery->num_rows){
			$count= $countquery->row['item'];
		}else{
		$count= 1;
		}
		$x=1;
		for ($x=1; $x<=$count; $x++){

			$query = $this->db->query("select RDVAL as value from epspe_rawfld as data inner join eps_rdtf as fields on data.rdfld = fields.rdfid
			where rdref = '" . $data['receipt']. "' and rdfld = '5' and rditm1 = '" . $x . "'");
			$arraypcs = $query->row['value'];
			$query = $this->db->query("select RDVAL as value from epspe_rawfld as data inner join eps_rdtf as fields on data.rdfld = fields.rdfid
			where rdref = '" . $data['receipt']. "' and rdfld = '6' and rditm1 = '" . $x . "'");
			$arraylen = $query->row['value'];
			$query = $this->db->query("select RDVAL as value from epspe_rawfld as data inner join eps_rdtf as fields on data.rdfld = fields.rdfid
			where rdref = '" . $data['receipt']. "' and rdfld = '7' and rditm1 = '" . $x . "'");
			$arraywid = $query->row['value'];
			$query = $this->db->query("select RDVAL as value from epspe_rawfld as data inner join eps_rdtf as fields on data.rdfld = fields.rdfid
			where rdref = '" . $data['receipt']. "' and rdfld = '8' and rditm1 = '" . $x . "'");
			$arrayhgt = $query->row['value'];

			$cube[$x] = (($arraypcs * $arraylen * $arraywid * $arrayhgt)/'1728');
		}
		$cft = array_sum($cube);

		$this->session->data['arrival_warehouse']= $warehouse;
		$this->session->data['arrival_pcs'] = $pcs;
		$this->session->data['arrival_weight']=number_format($weight,0);
		$this->session->data['arrival_cft']	= ceil($cft);



	}

	public function getArrivalsDateLast($data){
		$arrivalsql = "select RDVal from epspe_rawfld as data inner join eps_rdtf as fields on data.rdfld = fields.rdfid	where rdref = '" . $data . "'  and rdfld = '2' order by RDID desc limit 1";
		$query = $this->db->query($arrivalsql);

		if($query->num_rows){
		return $query->row['RDVal'];
		} else {
		return false;
		}

	}

	public function getArrivalsLast($data){
		$arrivalsql = "select RDVal from epspe_rawfld as data inner join eps_rdtf as fields on data.rdfld = fields.rdfid	where rdref = '" . $data . "'  and rdfld = '1' order by RDID desc limit 1";
		$query = $this->db->query($arrivalsql);
	if($query->num_rows){
		return $query->row['RDVal'];
		} else {
		return false;
		}
	}

	public function getCombined($combined){
		$sql = "select bkbookin as bkin from epspe_book where bkref ='" . $combined . "'";
		$query = $this->db->query($sql);
		return  $query->row['bkin'];

	}

	public function getCombinedItems($combined){
		$sql = "select bkpcs,BKWgtE,BKCubE,BkComm from epspe_book where bkref ='" . $combined . "'";
		$query = $this->db->query($sql);
		return  $query->row;

	}




}

?>
