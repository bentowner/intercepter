<?php
class ModelToolSync extends Model {
	public function restore($sql) {
		foreach (explode(";\n", $sql) as $sql) {
			$sql = trim($sql);

			if ($sql) {
				$this->db->query($sql);
			}
		}

		$this->cache->delete('*');
	}

	public function sync_vessels(){
		// updates vessels, vrotn and vessel cuts from ads
		$sql = "UPDATE `troyv2`.`troy_setting` SET `value` = '0' WHERE `troy_setting`.`setting_id` =2060";
		$this->db->query($sql);
	}
	public function sync_nontransactional(){
		// updates all non-transactional tables --BULK--
		$sql = "";
		$this->db->query($sql);
	}
	public function sync_transactional(){
		// updates all transactional tables --BULK--
		$sql = "";
		$this->db->query($sql);
	}
	public function sync_booking_web(){
		$sql = "UPDATE `troyv2`.`troy_setting` SET `value` = '0' WHERE `troy_setting`.`setting_id` =2045";
		$this->db->query($sql);
	}
	public function sync_booking_ads(){
		$sql = "UPDATE `troyv2`.`troy_setting` SET `value` = '0' WHERE `troy_setting`.`setting_id` =2044";
		$this->db->query($sql);
	}
	
	public function sync_booking_track_web(){
		$sql = "UPDATE `troyv2`.`troy_setting` SET `value` = '0' WHERE `troy_setting`.`setting_id` =2053";
		$this->db->query($sql);
	}
	public function sync_booking_track_ads(){
		$sql = "UPDATE `troyv2`.`troy_setting` SET `value` = '0' WHERE `troy_setting`.`setting_id` =2052";
		$this->db->query($sql);
	}
	
	public function sync_quote_web(){
		$sql = "UPDATE `troyv2`.`troy_setting` SET `value` = '0' WHERE `troy_setting`.`setting_id` =2047";
		$this->db->query($sql);
	}	
	public function sync_quote_ads(){
		$sql = "UPDATE `troyv2`.`troy_setting` SET `value` = '0' WHERE `troy_setting`.`setting_id` =2046";
		$this->db->query($sql);
	}
	
	public function sync_quote_track_ads(){
		$sql = "UPDATE `troyv2`.`troy_setting` SET `value` = '0' WHERE `troy_setting`.`setting_id` =2054";
		$this->db->query($sql);
	}
	
	public function sync_customer_web(){
		$sql = "UPDATE `troyv2`.`troy_setting` SET `value` = '0' WHERE `troy_setting`.`setting_id` =2049";
		$this->db->query($sql);
	}
	public function sync_customer_ads(){
		$sql = "UPDATE `troyv2`.`troy_setting` SET `value` = '0' WHERE `troy_setting`.`setting_id` =2048";
		$this->db->query($sql);
	}
	
	public function sync_arrivals_ads(){
		$sql = "UPDATE `troyv2`.`troy_setting` SET `value` = '0' WHERE `troy_setting`.`setting_id` =2056";
		$this->db->query($sql);
	}
	public function sync_arrivals_web(){
		$sql = "UPDATE `troyv2`.`troy_setting` SET `value` = '0' WHERE `troy_setting`.`setting_id` =2057";
		$this->db->query($sql);
	}
	
	public function sync_lclrawfld_ads(){
		$sql = "UPDATE `troyv2`.`troy_setting` SET `value` = '0' WHERE `troy_setting`.`setting_id` =3479";
		$this->db->query($sql);
	}
	
	
	
}