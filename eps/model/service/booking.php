<?php
/**
 * Page-level DocBlock
 */

class ModelServiceBooking extends Model {

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
		$sql = "";
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

	public function getLastBookings($data = array()) {
		$sql = "SELECT BKRef, BkUser, CustName1,BkOrig,BkDest,BKdate,Bkrate,BkTHC,BkBFS,BKHS,BkPSA,Bkblfe,bkcclr,Bkwsch,bkoncr,Bkothr,BkOr3,bkeufee
				FROM epspe_book join epspe_cust on (epspe_book.BkCust = epspe_cust.CustCode) ";
		$sort_data = array(
				'BKRef',
				'BkUser',
				'CustName1',
				'BkOrig',
				'BkDest',
				'BKdate',
				'Bkrate',
				'BkTHC',
				'BkBFS',
				'BKHS',
				'BkPSA',
				'Bkblfe',
				'bkcclr',
				'Bkwsch',
				'bkoncr',
				'Bkothr',
				'BkOr3',
				'bkeufee'
		);



		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY bkmodd";
		}


		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}
		//** @todo - Replace Sort order on initial booking/quote list
		/*
		$sql .= " ORDER BY bkmodd DESC";
	*/

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
	public function getBookingEmailHeader(){
		$headerinfo = $this->db->query("select value as header from oc_order_field where order_id = '1'");
		return $headerinfo->row['header'];

	}
	public function getBookingSummary($data) {

		$booking_summary = $this->db->query("SELECT bkref,CustName1,BkOrig,BkDest,BKdate,(Bkrate+Bkcdw+Bkblfe) FROM epspe_book
				join epspe_cust on (epspe_book.BkCust = epspe_cust.CustCode) where bkdate > \"2012-06-25\" order by bkdate desc LIMIT 0 , 10");

		if ($booking_summary->num_rows) {
			return array(
					'column_booking_no'          => $booking_summary->row['bkref'],
					'column_customer'            => $booking_summary->row['CustName1'],
					'column_service_from'        => $booking_summary->row['BkOrig'],
					'column_service_to'          => $booking_summary->row['BkDest'],
					'column_date_added'          => $booking_summary->row['BKdate'],
					'column_total'               => $booking_summary->row['Bkrate+Bkcdw+Bkblfe']
			);

		} else {return false;}
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

	public function getTotalBookings($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX_APP . "book`";

		$implode = array();
		if (!empty($data['filter_status'])) {
			$status = array();

			$booking_statuses = explode(',', $data['filter_status']);

			foreach ($booking_statuses as $booking_status) {
				$status[] = "BkStat = '" . $booking_status . "'";
			}

			if ($status) {
				$sql .= " WHERE (" . implode(" OR ", $status) . ")";
			}
		} else {
			$sql .= " WHERE bkref > '0'";

		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}

		if (isset($data['filter_date_added'])&& !is_null($data['filter_date_added'])) {
			$implode[] = "BKdate = '" . $this->db->escape($data['filter_date_added']) . "'";
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
			$sql .= " AND BKdate >= DATE('" . $this->db->escape($data['filter_date_since_added']) . "')";
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
