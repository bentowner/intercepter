<?php

/**
 * @author Ben Towner
 * @name Arrival - model - Service
 * @version 2.0.1
 * @package lclapp - Web application
 * @link http://www.TroyContainerLine.com
 */
class ModelOperationsArrivals extends Model {

		
	public function getArrivals_previous($data_arrival){
		$data_arrival['receipt']= $data_arrival['filter_receipt'];
		
		$arrivalsql = "SELECT * FROM `" . DB_PREFIX_APP . "arrivals` WHERE `Arrcode` = '" . $data_arrival['receipt']. "' ";
		$arrivalquery = $this->db->query($arrivalsql);
			
		$pcssql = "select rdval as pcs from lcl_rawfld as data inner join troy_rdtf as fields on data.rdfld = fields.rdfid
				where rdref = '" . $data_arrival['receipt']. "' and rdfld = '5' ";
		$pcsquery = $this->db->query($pcssql);
		
		$pcs = $pcsquery->row['pcs'];
	
		// Count item array
		$countsql = "select distinct rditm1 as item from lcl_rawfld as data inner join troy_rdtf as fields on data.rdfld = fields.rdfid
				  where rdref = '" . $data_arrival['receipt']. "' order by rditm1 desc limit 1";
		$countquery = $this->db->query($countsql);
		if ($countquery->num_rows){
			$count= $countquery->row['item'];
		}else{
			$count= 1;
		}
		$x=1;
		for ($x=1; $x<=$count; $x++){
				
			$query = $this->db->query("select RDVAL as value from lcl_rawfld as data inner join troy_rdtf as fields on data.rdfld = fields.rdfid
			where rdref = '" . $data_arrival['receipt']. "' and rdfld = '5' and rditm1 = '" . $x . "'");
			$arraypcs = $query->row['value'];
			$query = $this->db->query("select RDVAL as value from lcl_rawfld as data inner join troy_rdtf as fields on data.rdfld = fields.rdfid
			where rdref = '" . $data_arrival['receipt']. "' and rdfld = '6' and rditm1 = '" . $x . "'");
			$arraylen = $query->row['value'];
			$query = $this->db->query("select RDVAL as value from lcl_rawfld as data inner join troy_rdtf as fields on data.rdfld = fields.rdfid
			where rdref = '" . $data_arrival['receipt']. "' and rdfld = '7' and rditm1 = '" . $x . "'");
			$arraywid = $query->row['value'];
			$query = $this->db->query("select RDVAL as value from lcl_rawfld as data inner join troy_rdtf as fields on data.rdfld = fields.rdfid
			where rdref = '" . $data_arrival['receipt']. "' and rdfld = '8' and rditm1 = '" . $x . "'");
			$arrayhgt = $query->row['value'];
				
			$cube[$x] = (($arraypcs * $arraylen * $arraywid * $arrayhgt)/'1728');
		}
		$cft = array_sum($cube);
	
		
		$this->session->data['arrival_pcs'] = $pcs;
		$this->session->data['arrival_cft']	= ceil($cft);
	
	return $arrivalquery->row;
	
	}
	
public function getArrivals($data_arrival = array()) {
		$sql = "SELECT * FROM `" . DB_PREFIX_APP . "arrivals` ";
			
		$implode = array();
		$sql .= "WHERE Arrin is not null";
			
		if (isset($data_arrival['filter_receipt']) && !is_null($data_arrival['filter_receipt'])) {
			$implode[] = "Arrcode like '%" . $data_arrival['filter_receipt'] . "%'";
		}
	
		if (isset($data_arrival['filter_booking_id']) && !is_null($data_arrival['filter_booking_id'])) {
			$implode[] = "left(ArrABk,6) ='" . $data_arrival['filter_booking_id'] ."'";
		}
			
		if (isset($data_arrival['filter_date_added']) && !is_null($data_arrival['filter_date_added'])) {
			$implode[] = "Arrin = '" . $this->db->escape($data_arrival['filter_date_added']) . "'";
		}
			
		if (isset($data_arrival['filter_warehouse']) && !is_null($data_arrival['filter_warehouse'])) {
			$implode[] = "ArrWhse LIKE '%" . $this->db->escape($data_arrival['filter_warehouse']) . "%'";
		}
			
		if (isset($data_arrival['filter_po_pro']) && !is_null($data_arrival['filter_po_pro'])) {
			$implode[] = "ArrPO LIKE '%" . $this->db->escape($data_arrival['filter_po_pro']) . "%'";
		}
	
		if (!empty($data_arrival['filter_recv_from']) && !is_null($data_arrival['filter_recv_from'])) {
			$implode[] = "ArrRecv = '" . $data_arrival['filter_origin_code']. "'";
		}
			
		if (!empty($data_arrival['filter_recv_via']) && !is_null($data_arrival['filter_recv_via'])) {
			$implode[] = "ArrVia = '" . $data_arrival['filter_recv_via'] . "'";
		}
	
		if (!empty($data_arrival['filter_load_plan']) && !is_null($data_arrival['filter_load_plan'])) {
			$implode[] = "ArrLP  = '" . $this->db->escape($data_arrival['filter_commodity']) . "'";
		}
			
			
		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}
		
		$sort_data = array(
				'Arrcode',
				'ArrWhse',
				'ArrABK',
				'ArrPO',
				'ArrRecv',
				'ArrVia',
				'ArrLP'
		
		);
	
		if (isset($data_arrival['sort']) && in_array($data_arrival['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data_arrival['sort'];
		} else {
			$sql .= " ORDER BY ArrIn";
		}
		
		if (isset($data_arrival['order']) && ($data_arrival['order'] == 'ASC')) {
			$sql .= " DESC";
		} else {
			$sql .= " DESC";
		}
		
		if (isset($data_arrival['start']) || isset($data_arrival['limit'])) {
			if ($data_arrival['start'] < 0) {
				$data_arrival['start'] = 0;
			}
		
			if ($data_arrival['limit'] < 1) {
				$data_arrival['limit'] = 20;
			}
				
			$sql .= " LIMIT " . (int)$data_arrival['start'] . "," . (int)$data_arrival['limit'];
		}
		
		
		$query = $this->db->query($sql);
		
		$this->session->data['arrival_test_1'] =$sql;
			
		return $query->rows;
			
			
	}
	
	public function getTotalArrivals($data_arrival = array()) {
		$sql = "SELECT count(*) AS total  FROM `" . DB_PREFIX_APP . "arrivals` ";
			
		$implode = array();
		$sql .= "WHERE Arrin is not null";
			
		if (isset($data_arrival['filter_receipt']) && !is_null($data_arrival['filter_receipt'])) {
			$implode[] = "Arrcode like '%" . $data_arrival['filter_receipt'] . "%'";
		}
	
		if (isset($data_arrival['filter_booking_id']) && !is_null($data_arrival['filter_booking_id'])) {
			$implode[] = "left(ArrABk,6) like'%" . $data_arrival['filter_booking_id'] ."%'";
		}
			
		if (isset($data_arrival['filter_date_added']) && !is_null($data_arrival['filter_date_added'])) {
			$implode[] = "Arrin = '" . $this->db->escape($data_arrival['filter_date_added']) . "'";
		}
			
		if (isset($data_arrival['filter_warehouse']) && !is_null($data_arrival['filter_warehouse'])) {
			$implode[] = "ArrWhse LIKE '%" . $this->db->escape($data_arrival['filter_warehouse']) . "%'";
		}
			
		if (isset($data_arrival['filter_po_pro']) && !is_null($data_arrival['filter_po_pro'])) {
			$implode[] = "ArrPO LIKE '%" . $this->db->escape($data_arrival['filter_po_pro']) . "%'";
		}
	
		if (!empty($data_arrival['filter_recv_from']) && !is_null($data_arrival['filter_recv_from'])) {
			$implode[] = "ArrRecv = '" . $data_arrival['filter_origin_code']. "'";
		}
			
		if (!empty($data_arrival['filter_recv_via']) && !is_null($data_arrival['filter_recv_via'])) {
			$implode[] = "ArrVia = '" . $data_arrival['filter_recv_via'] . "'";
		}
	
		if (!empty($data_arrival['filter_load_plan']) && !is_null($data_arrival['filter_load_plan'])) {
			$implode[] = "ArrLP  = '" . $this->db->escape($data_arrival['filter_commodity']) . "'";
		}
			
			
		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}
	
		
		$query = $this->db->query($sql);
		
			
		return $query->row['total'];
			
			
	}
	
	public function getBookingInfo($arrival){
		$sql="select * from lcl_book where bkref = (select left(ArrABk,6) from lcl_arrivals where Arrcode = '" . $arrival . "')";
		$booking = $this->db->query($sql);
		return $booking->row;
		
	}
	public function getWarehouse_name($warehouse_code){
	
		$warehouse = $this->db->query("select warename1,warename2,warename3,warename4,warephon,warezip,warecode,warecont,warefax,wareeemail,warepresend FROM troy_ware where warecode ='". $warehouse_code ."' ");
	
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
	
	public function addArrivals($data_arrival) {
		
	}
	
	public function statusArrivals($data_arrival){
		$sql=" select arredit,arrLP from lcl_arrivals where Arrcode = '".$data_arrival."' ";

		$query = $this->db->query($sql);
		
		if(!$query->num_row){
		return false;
		}
		
		return $query->row;
	}
	
	/*Arrival Unit
	 * getfloorftpspecs
	 * getNYCut
	 * MatchOrig
	 * setthecontols
	 * updatethecube
	 *  
	 */
	
}

?>