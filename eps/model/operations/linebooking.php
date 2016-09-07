<?php

/**
 * @author Ben Towner
 * @name Line Booking - model - Operations
 * @version 0.1
 * @package lclapp - Web application
 * @link http://www.TroyContainerLine.com
 */
class ModelOperationsLinebooking extends Model {

				
		public function getLinebooking($data) {
						
			$query = $this->db->query("select * from troy_linebook where LBRef  = '" . $data . "' ");
						
			return $query->row;
		}
				
		public function getLinebookings($data) {
			$sql = "select * from troy_linebook";

			$implode = array();
			$sql .= " where LBRef not like '~%'"; 
			
			if (isset($data['filter_ref']) && !is_null($data['filter_ref'])) {
				$implode[] = "LBRef LIKE '%" . $this->db->escape($data['filter_ref']) . "%'";
			}
			if (isset($data['filter_booking']) && !is_null($data['filter_booking'])) {
				$implode[] = "LBBook LIKE '%" . $this->db->escape($data['filter_booking']) . "%'";
			}
			if (isset($data['filter_vessel']) && !is_null($data['filter_vessel'])) {
				$implode[] = "LBVess LIKE '%" . $this->db->escape($data['filter_vessel']) . "%'";
			}
			
			if ($implode) {
				$sql .= " AND " . implode(" AND ", $implode);
			}
	
			$sort_data = array(
						'LBRef',
						'LBBook',
						'LBVess'
								);
				
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY LBLine ";
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


		
	}
	?>