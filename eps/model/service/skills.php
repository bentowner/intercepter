<?php
class ModelServiceSkills extends Model {

	public function getSkillsList(){
		$service = $this->db->query( "select vrname,vrref,vrcolorhex from eps_vrotn where vrname not like '~%' order by vrname asc");
		return $service->rows;
	}
	public function getSkills(){

		$sql = "SELECT `total` as count_items,`employee` as usrname,`matrix_id` as usrid FROM `epspe_skills_matrix` ORDER by total DESC ";

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

	public function validateService($bkorig,$bkdest){
		$sql = "select * from eps_vrotn where vrref = (select Distinct lttrot from epspe_tt as a where a.lttorig =  '". $bkorig ."'  and a.lttdest = '". $bkdest ."')";
		$service = $this->db->query($sql);

		if ($service->num_rows){
			return 'true';
		} else {
			return 'false';
		}
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
