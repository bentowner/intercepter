<?php

/**
 * @author Ben Towner
 * @name load plan - model - Operations
 * @version 0.1
 * @package lclapp - Web application
 * @link http://www.TroyContainerLine.com
 */
class ModelOperationsLoadplan extends Model {

				
		public function getLoadPlan_detail($data) {
						
			$query = $this->db->query("select * from lcl_loadplan where LDRef = '" . $data . "' ");
						
			return $query->row;
		}
				
		public function getLoadPlan($data) {
			$sql = "select * from lcl_loadplan ";

			$implode = array();
			$sql .= " where LDRef not like '~%'"; 
			
			if (isset($data['filter_name']) && !is_null($data['filter_name'])) {
				$implode[] = "LDRef LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
			}
				
			
			if ($implode) {
				$sql .= " AND " . implode(" AND ", $implode);
			}
	
			$sort_data = array(
						'vesname'
								);
				
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY LDRef ";
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