<?php
class ModelServiceService extends Model {
	
	public function getServiceList(){
		$service = $this->db->query( "select vrname,vrref,vrcolorhex from eps_vrotn where vrname not like '~%' order by vrname asc");
		return $service->rows;
	}
	public function getService($bkrotn){
		$service = $this->db->query("select vrname,vragt1,vrssl,vrunlo,vrload,vrcolr  from eps_vrotn where vrref = '". $bkrotn ."' ");
		//select vrname from eps_vrotn where vrref = (select Distinct lttrot from epspe_tt as a where a.lttorig =  'NY'  and a.lttdest = 'TPT')
		return array(
				'vrname'=>$service->row['vrname'],
				'vragt1'=>$service->row['vragt1'],
				'vrssl' =>$service->row['vrssl'],
				'vrunlo'=>$service->row['vrunlo'],
				'vrload'=>$service->row['vrload'],
				'vrcolr'=>$service->row['vrcolr']
		);
	}
	
	public function validateService($bkorig,$bkdest){
		$sql = "select * from eps_vrotn where vrref = (select Distinct lttrot from epspe_tt as a where a.lttorig =  '". $bkorig ."'  and a.lttdest = '". $bkdest ."')";
		$service = $this->db->query($sql);
		
		if ($service->num_rows){
			return 'true';
		} else {
			return 'false';
		}
	}
	public function getServiceRotation($bkorig,$bkdest){
		$sql = "select vrref,vrname,vragt1 from eps_vrotn where vrref = (select Distinct lttrot from epspe_tt as a where a.lttorig =  '". $bkorig ."'  and a.lttdest = '". $bkdest ."')";
		$service = $this->db->query($sql);
		$this->session->data['service_test'] = $sql;
		return array('vrref'=>$service->row['vrref'],'vrname' =>$service->row['vrname'],'vragt1' =>$service->row['vragt1']);
	}
	
	public function getRoutedService($orig,$dest,$cust){
		$services = $this->db->query("select custlastr,custrcom4 from epspe_cust where custcode = '". $cust ."' ");
		
		$original = $this->getRotation($orig,$dest);
		$routed =$this->db->query("select vrref from eps_vrotn where vrunlo = '".$services->row['custlastr']."'");
		$routedAlt =$this->db->query("select vrref from eps_vrotn where vrunlo = '".$services->row['custrcom4']."'");

		$this->session->data['test_customer_spec_model'] = $original['lttrot']." ".$routed->row['vrref']." ".$routedAlt->row['vrref'];
		
		if($original['lttrot'] == $routed->row['vrref'] ){return true;} else if($original['lttrot'] == $routedAlt->row['vrref'] ){return true;} else{
		
		return false;
		}
		
	}
	public function getServiceRotation_code($vrref){
		$service = $this->db->query("select vrref from eps_vrotn where vrname = '". $vrref ."' ");
		return $service->row['vrref'];
	}
	
	public function getService_description($OrigCode,$DestCode){
		$OrigName = $this->db->query("SELECT OrigName,OrigCode FROM `eps_origads` WHERE OrigCode = '". $OrigCode ."' ");
		$DestName = $this->db->query("SELECT DestName,DestCode FROM `eps_destads` WHERE DestCode = '". $DestCode ."' ");
	
		return array(
				'OrigName'               => $OrigName->row['OrigName'],
				'OrigCode'				 => $OrigName->row['OrigCode'],
				'DestCode'               => $DestName->row['DestCode'],
				'DestName'               => $DestName->row['DestName']
		);
	}
	
	public function getRotation($bkorig,$bkdest){
		$bkrotn = $this->db->query("select Distinct lttrot,lttload,lttunlo,lttdday,ltttt,ltthtt from epspe_tt as a where a.lttorig =  '". $bkorig ."'  and a.lttdest = '". $bkdest ."'");
		
		return $bkrotn->row;
	}
	
	public function getAgent($data){
		$bkrotn = $this->db->query("select agenname1,agenname2,agenname3,agenname4,agenphon,agennote1,agenudestq,agendclause,agenpechg,agenffchg,agennodestchg from eps_agenads where agencode = '". $data ."'");
		return $bkrotn->row;
	}
	// Cargo Cutoff time
	public function getCutTimeAdjust($bkorig,$bkrotn,$date){
				
		$adjustWarehouse = "SELECT RDVal from epspe_rawfld where rdfld = 49  and RDItm1 = (SELECT RDItm1 from epspe_rawfld where rdfld =48  and RDVal ='". $bkorig ."' and RDRef = (SELECT concat(vesref,vesseq) FROM eps_vessels where vesref = '". $bkrotn ."' and vesload >= '". $date ."' limit 1 )
		) and RDRef = (SELECT concat(vesref,vesseq) FROM eps_vessels where vesref = '". $bkrotn ."' and vesload >= '". $date ."' limit 1 )";
		
		return $adjustWarehouse->row['RDVal'];
		
	}
	
	public function getSailingSchedule($data){
		$sql = "select ADDDATE(vesload,-(lttoday)) as cargocut,ADDDATE(vesload,-1) as aescut,vesactualetd as saildate,vesname,vesvoyg,lineSCAC, 
				ADDDATE(vesunlo,(lttdday)) as eta, concat(vesref,vesseq) as vessel, vesssl as bkssl, vesseq, a.ltttim from epspe_tt as a 
				join eps_vessels as b on a.lttrot = b.vesref 
				join eps_lineads as c on c.linecode = b.vesssl 
				where a.lttdest = '". $data['destination']."' ";

		if (isset($data['idd'])) {
		$sql .= "and ADDDATE(vesload,-(lttoday)) >  '". $data['idd'] ."'";
		}else {
		$sql .= "and ADDDATE(vesload,-(lttoday)) > ADDDATE(now(),-1)";
		}
		
		$sql .= "and a.lttorig =  '". $data['origin'] ."'";

		if (isset($data['next'])) {
		
			$sql .= " LIMIT ". $data['next'] ." ";
		}
				
		$query = $this->db->query($sql);
		$this->session->data['sail_query'] = $sql;
		return $query->rows;
	}
	
	public function getSailingSchedule2($data){
		$lttdday_query =  $this->db->query("select lttdday from epspe_tt where lttorig ='". $data['origin'] ."' and lttdest ='". $data['destination'] ."'");
		$lttdday = $lttdday_query->row['lttdday'];
		
		$sql = "select vcutdate as cargocut,vcutddate as aescut,vesactualetd as saildate,vesname,vesvoyg,lineSCAC,
				date_add(vesunlo,interval ".$lttdday." day) as eta, concat(vesref,vesseq) as vessel, vesssl as bkssl, vesseq, vcuttime,vcutctim, 
				concat(vcutddate,' ',vcutdtime) as doc_cuts, vesactualtt, (Weekday(vcutdate))+1 as Bkcdw from eps_vessel_cuts as a 
				join eps_vessels as b on (a.vcutrotn = b.vesref and a.vcutseqn=b.vesseq)
				join eps_lineads as c on c.linecode = b.vesssl";
	
		if (isset($data['vessel_id'])){
			$sql .= " where concat(vcutrotn,vcutseqn) = '". $data['vessel_id'] ."'";
		} else{
			$sql .= " where vcutrotn = '". $data['rotation'] ."'";
		}
		
		if (isset($data['idd'])) {
			$sql .= " and vcutdate >=  '". $data['idd'] ."'";
		}else {
			$sql .= " and vcutdate >ADDDATE(now(),-1)";
		}
	
		$sql .= " and vcutcfs =  '". $data['origin'] ."' order by vesactualetd asc ";
	
		if (isset($data['next'])) {
	
			$sql .= " LIMIT ". $data['next'] ." ";
		}
	
		$query = $this->db->query($sql);

		$this->session->data['sail_query2'] = $sql;
		return $query->rows;
	}
	public function getEta($orig,$dest){
		$sql = "select lttdday as deliverDays from epspe_tt where lttorig = '". $orig ."' and lttdest ='". $dest ."' ";
	
		$query = $this->db->query($sql);
	
		return $query->row['deliverDays'];
	}
	
	public function getVessel($bkrotn){
	
		$sailingSchedule = $this->db->query("Select * FROM eps_vessels where vesload > ADDDATE(now(),-1) and vesref = '". $bkrotn ."'  
				order by vesload asc");
	
		return $sailingSchedule->rows;
	}
	
	public function getVesselSail($data){
		
		$sql = "SELECT ADDDATE(vesload,+1) , vesname,vesvoyg,lineSCAC, ADDDATE(vesload,vesactualtt+1) as eta FROM eps_vessels 
				join eps_lineads on eps_lineads.linecode = eps_vessels.vesssl 
				where vesref = (select Distinct lttrot from epspe_tt as a where a.lttorig =  '". $data['origin'] ."'  and a.lttdest = '". $data['destination']."') 
				and vesload > ADDDATE(now(),+1)
				order by vesload asc";
		
		$query = $this->db->query($sql);
		return $query->rows;
				
	}
	
	public function getDelivDate ($idd,$bkorig,$bkdest){
		//Transit times for rotation
	
		$service= "select lttrot,lttcut,ltttim,lttoday,lttload from epspe_tt where lttrot = (select distinct lttrot from epspe_tt as a
				where a.lttorig =   '". $bkorig ."'  and a.lttdest = '". $bkdest ."') and lttorig = '". $bkorig ."'  and lttdest = '". $bkdest ."'";
		$query = $this->db->query($service);
		$lttcut = $query->row['lttcut'];
		$ltttim = $query->row['ltttim'];
		$lttoday= $query->row['lttoday'];
		$lttload= $query->row['lttload'];
	
		//Find nearest cut off day
		$numberDay = $this->db->query("select CDcode from eps_cutday where CDDesc = (select dayname('". $idd ."'))");
	
		if ($numberDay == $lttcut){$bketd = "SELECT ADDDATE('".$idd."',$lttoday) as ETD";}
		if ($numberDay > $lttcut ){$bketd = "SELECT ADDDATE('".$idd."',+(7+$lttoday-$lttcut)) as ETD";}
		if ($numberDay < $lttcut ){$bketd = "SELECT ADDDATE('".$idd."',+(+$lttcut-$numberDay+$lttoday)) as ETD";}
	
		$query2 = $this->db->query($bketd);
		$ETD = $query2->row['ETD'];
		$query3 = $this->db->query("SELECT ADDDATE('".$ETD."',-$lttoday) as LDD");
	
		//$query2 = $query->row;
		return array(
				ETD =>$query2->row['ETD'],
				LDD =>$query3->row['LDD'],
				LDT =>$ltttim,
				CDW =>$lttcut,
				APL =>$lttload
		);
	
		/* Add Adjustment after Raw Fields are converted...
		 * "SELECT RDVal from epspe_rawfld where rdfld = 49  and RDItm1 = (SELECT RDItm1 from epspe_rawfld where rdfld =48  and RDVal ='". $bkorig ."''". $bkorig ."' and RDRef = (SELECT concat(vesref,vesseq) FROM eps_vessels where vesref = '".$lttrot."' and vesload >= now() limit 1 )
			) and RDRef = (SELECT concat(vesref,vesseq) FROM eps_vessels where vesref = '".$lttrot."' and vesload >= now() limit 1 )"
	
		*/
	}
	
	public function getCargoCut($lttorig){
		//** @todo - South Altantic, East/West routes
		
		
		
	}
	
	public function getDocumentCut($lttorig){
		//** @todo - AES cutoff times with time of day
		
		
	}
	

	
	public function getTime($data){
		$time = $this->db->query("select ctdesc as tim from eps_cuttim where ctcode = '". $data ."' ");
		return $time->row['tim'];
	}
	
	public function getDay($data){
		$day = $this->db->query("select * from eps_cutday where CDcode = '". $data ."' ");
		return $day->row['CDShort'];
		
	}
	public function getWarehouse($BkWare){
		$warehouse = $this->db->query("SELECT warename1,warename3,warename4,warephon,warecfs FROM eps_ware where warecode ='". $BkWare ."' ");
		
		return $warehouse;
	}

	public function getWarehouseCutoff($bkorig,$bkdest){
		
		$warehouse = $this->db->query("select CDDesc,ctdesc,ctcode as bkldt,cdcode as bkcdw from epspe_tt tt
										inner join eps_cutday dayofwk on dayofwk.CDcode = tt.lttcut
										inner join eps_cuttim timeday on timeday.ctcode = tt.ltttim
										where lttorig = '". $bkorig ."' and lttdest = '". $bkdest ."'");
	
		return array(
				'cutoffday' =>$warehouse->row['CDDesc'],
				'cutofftime'=>$warehouse->row['ctdesc'],
				'bkldt'=>$warehouse->row['bkldt'],
				'bkcdw'=>$warehouse->row['bkcdw'],
		);
	}
	
	public function getWarehouse_name($service_portofloading_code){
		
		$warehouse = $this->db->query("select warename1,warename2,warename3,warename4,warephon,warezip,warecode,warecont,warefax,wareeemail,warepresend FROM eps_ware where warecode =(SELECT OrigWare FROM eps_origads where OrigCode = '". $service_portofloading_code ."')");
		
		return array(
				'warename1' =>$warehouse->row['warename1'],
				'wareaddress1' =>$warehouse->row['warename2'],
				'wareaddress' =>$warehouse->row['warename3'],
				'warecity' =>$warehouse->row['warename4'],
				'warecontact' =>$warehouse->row['warecont'],
				'warephone'=>$warehouse->row['warephon'],
				'warefax'=>$warehouse->row['warefax'],
				'wareemail'=>$warehouse->row['wareeemail'],
				'warepresend'=>$warehouse->row['warepresend'],
				'warehouse_zip'=>$warehouse->row['warezip'],
				'service_warehouse'=>$warehouse->row['warecode']
		);
	}
	
	public function getWarehouse_code($service_portofloading){
	
		$warehouse = $this->db->query("SELECT warecode FROM eps_ware where warename1 = '". $service_portofloading ."' ");
		return $warehouse->row['warecode'];
	}
	

		
	public function getTrucking($data){
		
		$ctsrequest = file_get_contents('http://www.shipwithcts.com/cts/shiprite/rater.cfm?action=xml&UID=565&Class1=70&FromZip=' . $data['FromZip'] .
				'&ToZip=' . $data['ToZip'] . '&ShipDate='. $data['ShipDate'] .  '&Weight1='. $data['Weight1'] .'&cube='. $data['cube'].'');
		
		$xml = simplexml_load_string($ctsrequest);
		
		$json = json_encode($xml);
		
		$array = json_decode($json,TRUE);
		
		return $array;
		
	}		
	
	public function getTrucking_manual($data){
		
			$sql = "SELECT STATE,CITY,COMPANY,TELEPHONE,FAX,NOTES_CONTACTS,EMAIL,rate_sheet FROM epspe_trucker_manual";
		
			$sql .= " WHERE STATE LIKE '%" . $data['state'] ."  or STATE ='USA' ";
			
			$query = $this->db->query($sql);
		
			$this->session->data['test_trucking_manual'] = $sql;
			
			return $query->rows;
		
	}
	
	public function getPortofLoading($data) {
		$sql = "SELECT OrigCode, OrigName FROM eps_origads WHERE origuselcl='false' and  origcode <> 'LB' "; //PushtoWEB => origuselcl='false' 

		if (!empty($data['filter_name'])) {
			$sql .= " AND OrigName LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}
		
		$sql .= " GROUP BY OrigCode ORDER BY OrigName";
		
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
	
	public function getPortofLoading_name($service_portofloading_code) {
		$portofloading_query = $this->db->query("SELECT OrigName FROM `eps_origads` WHERE OrigCode = '". $service_portofloading_code ."' ");
	
		return $portofloading_query->row['OrigName'];
			
	}
	public function getPortofLoading_code($service_portofloading) {
		$portofloading_query = $this->db->query("SELECT OrigCode FROM `eps_origads` WHERE OrigName = '". $service_portofloading ."' ");
	
		return $portofloading_query->row['OrigCode'];
			
	}
	public function getPortofDestination($data=array()) {
		$sql = "SELECT DestCode, DestName,destnodestchgfor,destagentchg,destagentps,destagentff,destclause  FROM eps_destads  
				WHERE (destnlcl='N' or destnlcl='L') and usedestlcl <> 'true' ";
		
		if (!empty($data['filter_name'])) {
			$sql .= " AND DestName like '" . $data['filter_name'] . "%'";
		}
		
		$sql .= " ORDER BY DestName";
		
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
	
	public function getPortofDestination_name($service_portofdest_code) {
		$portofdestination_query = $this->db->query("SELECT DestName FROM `eps_destads`  WHERE DestCode = '". $service_portofdest_code ."' ");
	
		return $portofdestination_query->row['DestName'];;
	}
	public function getPortofDestination_code($service_portofdest) {
		$portofdestination_query = $this->db->query("SELECT DestCode FROM `eps_destads`  WHERE DestName = '". $service_portofdest ."' ");
	
		return $portofdestination_query->row['DestCode'];;
	}

	
	public function getCategories($data) {
		$sql = "SELECT cp.category_id AS category_id, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR ' &gt; ') AS name, c.parent_id, c.sort_order FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "category c ON (cp.path_id = c.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (c.category_id = cd1.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (cp.category_id = cd2.category_id) WHERE cd1.language_id = '" . (int)$this->config->get('config_language_id') . "' AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'";
	
		if (!empty($data['filter_name'])) {
			$sql .= " AND cd2.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}
	
		$sql .= " GROUP BY cp.category_id ORDER BY name";
	
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
	
	public function getRates($bkold, $bookingoptions, $service){
		
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
				dest.destcoll as dest_coll,
				country.cntyhazt as cnty_hazt,
				dest.destnohaz as dest_nohaz,
				country.cntyblcl as cnty_blcl,
				country.cntycorq as cnty_corq,
				country.cntycirq as cnty_cirq,
				country.cntyplrq as cnty_plrq,
				country.cntyinsp as cnty_insp,
				country.cntyfri as cnty_fri,
				country.cntylres as cnty_lres,
				country.cntyldrq as cnty_ldrq,
				country.cntypoen as cnty_poen,
				dest.destdisc as dest_disc,
				country.cntypoec as cnty_poec,
				dest.destcca as dest_cca,
				dest.destcpod as dest_cpod,
				dest.useedestfcl as useedestfcl,
				country.cntypall as cnty_pall,
				dest.desteureq as desteureq,
				dest.destclause as destclause,
				dest.desthclause as desthclause
				from  eps_cntyads as country
				inner join eps_destads as dest on dest.destcnty = country.cntycode
				where dest.destcode = '" . $data . "' ";
		$query = $this->db->query($sql);
	
		return $query->row;
	
	}
	
	public function getHS($data){
		// replace procedure checkreqs on NVO
		$sql = "select vreureq as HC_required from eps_vrotn where vrref = '" . $data . "' ";
		$query = $this->db->query($sql);
	
		return $query->row;
	}
	
	public function getTotalQuotes() {
		$query = $this->db->query("SELECT SUM(qtofsell) AS total FROM `epspe_quotes` where QtDate > '2013-01-01'");
	
		return $query->row['total'];
	}
	
	public function getTotalSales() {
		$query = $this->db->query("SELECT SUM(Bkrate) AS total FROM `epspe_book` where BKdate > '2013-01-01'");
	
		return $query->row['total'];
	}
	
	public function getTotalSalesByYear($year) {
		$query = $this->db->query("select sum(BKRate)+sum(BkTHC)+sum(BkBFS)+sum(BKHS)+sum(BkPSA)+sum(Bkblfe)+sum(bkcclr)+sum(Bkwsch)+sum(bkoncr)+sum(Bkothr)+sum(BkOr3)+sum(bkeufee ) as total from epspe_book where YEAR(BKdate) > '" . (int)$year . "'");
	
		return $query->row['total'];
	}
	
	
	public function getTotalCountBooking($data) {
		$sql = "SELECT COUNT(*) AS total FROM `epspe_book` ";
		$implode = array();
		$sql .= " WHERE BkRef > '0'";
		
		if (!empty($data['filter_open']) && !is_null($data['filter_open'])) {
			if ($data['filter_open']=='NONE'){
				$implode[] = "bkstat = 'O' ";
			} else{
				$implode[] = "bkstat = 'O' and BkOrig = '" . $this->db->escape($data['filter_open']) . "'";
			}
		}
		if (!empty($data['filter_received']) && !is_null($data['filter_received'])) {
			if ($data['filter_received']=='NONE'){
				$implode[] = "bkstat = 'R' ";
			} else{
				$implode[] = "bkstat = 'R' and BkOrig = '" . $this->db->escape($data['filter_received']) . "'";
			}
		}
		if (!empty($data['filter_sameday']) && !is_null($data['filter_sameday'])) {
			if ($data['filter_sameday']=='NONE'){
				$implode[] = "bkstat = 'O' and bkidd >= BkLDD ";
			} else{
			$implode[] = "bkstat = 'O' and bkidd >= BkLDD and BkOrig = '" . $this->db->escape($data['filter_sameday']) . "'";
			}
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}
		
		$query = $this->db->query($sql);
	
		return $query->row['total'];
	}
	
	
	public function getTotalBookings($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM `epspe_book` where BKdate > '2014-01-01' ";
	
		$query = $this->db->query($sql);
	
		return $query->row['total'];
	}
	
	public function getTotalNoQuotes($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM `epspe_quotes` where QtDate > '2014-01-01' ";
	
		$query = $this->db->query($sql);
	
		$web_sql = "select count(*) as webtotal from eps_website where webdatetime > '2014-01-01' ";
		
		$web_query = $this->db->query($web_sql);
		
		$quotes = ($query->row['total'] + $web_query->row['webtotal']);
		return $quotes;
	}
	
	public function getStatistics($data = array()) {
		$sql = "SELECT * FROM `epspe_summary`";
	
		$query = $this->db->query($sql);
	
		return array(
				'sumbooking'  =>$query->row['sumbooking'],
				'sumquotes'		=>$query->row['sumquotes'],
				'numberquotes'	=>$query->row['numberquotes'],
				'numberbooking'	=>$query->row['numberbooking'],
				'numberactivecust'	=>$query->row['numberactivecust']);
	}
	
	public function get30Booking(){
		$sql = "select count(*) as count_items,usrname,usrid from epspe_book as book 
				inner join eps_usrinfo as name on name.usrid = book.BkUser
				where book.bkdate > date_add(CURDATE(),interval -1 day)
				group by bkuser order by count_items desc ";
		
		$query = $this->db->query($sql);
		
		
		if($query->num_rows){
			return $query->rows;
		} else {
			$no_data[] = array( 
					"count_items" => "0",
					"usrname" => "No Booking Found" ,
					"usrid" => "admin" );
			return $no_data;
		}
	}
	
	public function get30Quotes(){
		$sql = "select count(*) as count_items,usrname,usrid from epspe_quotes as quote 
				inner join eps_usrinfo as name on name.usrid = quote.qtby
				where quote.qtdate > CURDATE()
				group by qtby order by count_items desc ";
	
		$query = $this->db->query($sql);
	
		if($query->num_rows){
			return $query->rows;
		} else {
			$no_data[] = array( 
					"count_items" => "0",
					"usrname" => "No Quotations Found" ,
					"usrid" => "admin" );
			return $no_data;
		}
	
	
	}
	
	public function get30Quotes_website(){
		$sql = "select count(*) as webtotal from eps_website where date(webdatetime) = curdate()";
	
		$query = $this->db->query($sql);
	
		return $query->row['webtotal'];
	
	
	}
	
}

?>