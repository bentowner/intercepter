<?php
Class Object{
	private $object_ref;
	private $user_id;
	private $time;
	private $object_data = array();
	private $booking_total;
	private $quote_total;
	
	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->db = $registry->get('db');
		$this->request = $registry->get('request');
		$this->session = $registry->get('session');
		$this->user = $registry->get('user');
	}
	
	public function Booking($booking_no) {
		$this->validateObject();
		
		$object_query = $this->db->query("select * from troy_objects where object_description = 'Booking' and user_id != '".$this->user->getId() ."'
				and object_ref = '" . $booking_no . "' ");
			
		if ($object_query->num_rows) {
			$user_id = $object_query->row['user_id'];
			$time = $object_query->row['timestamp'];
			$object_data = unserialize($object_query->row['object_data']);
	
			return array(
					'user_id'=>$user_id,
					'time'=>$time);
		} else {
			return false;
		}
	}
	
	public function Quote($quote_no) {
		$this->validateObject();
		
		$object_query = $this->db->query("select * from troy_objects where object_description = 'Quote' and user_id != '".$this->user->getId() ."'
				and object_ref = '" . $quote_no . "' ");
			
		if ($object_query->num_rows) {
			$user_id = $object_query->row['user_id'];
			$time = $object_query->row['timestamp'];
			$object_data = unserialize($object_query->row['object_data']);
	
			return array(
					'user_id'=>$user_id,
					'time'=>$time);
		} else {
			return false;
		}
	}
	
	public function validateObject(){
		$sql ="delete from troy_objects where timestamp < date_add(now(),interval - 30 MINUTE)";
		$query = $this->db->query($sql);
		return;
	}
	
	public function hasValue($key, $value) {
		if (isset($this->object_data[$key])) {
			return in_array($value, $this->object_data[$key]);
		} else {
			return false;
		}
	}
	
	public function getBookingTotalObj(){
		$object_query = $this->db->query("select count(*) as total from troy_objects where object_description = 'Booking' and user_id = '".$this->user->getId() ."' ");
		$this->booking_total = $object_query->total;
		
		return true;
	}
	
	public function getQuoteTotalObj(){
		$object_query = $this->db->query("select count(*) as total from troy_objects where object_description = 'Quote' and user_id = '".$this->user->getId() ."' ");
		return $object_query->row['total'];
	}
}
?>