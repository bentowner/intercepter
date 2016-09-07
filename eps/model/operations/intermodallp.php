<?php

/**
 * @author Ben Towner
 * @name intermodallp - model - Operations
 * @version 0.1
 * @package lclapp - Web application
 * @link http://www.TroyContainerLine.com
 */
class ModelOperationsIntermodallp extends Model {

				
		public function getIntermodallp_detail($port,$year) {
						
			$query = $this->db->query("select * from lcl_intermodal_load where LDPort = '" . $port . "' and  LDYear = '" . $year . "' ");
						
			return $query->row;
		}
				
		public function getIntermodallp($data) {
			$sql = "select * from lcl_intermodal_load  ";

			$implode = array();
			$sql .= " where LDPort not like '~%'"; 
			
			if (isset($data['filter_cfs']) && !is_null($data['filter_cfs'])) {
				$implode[] = "LDPort LIKE '%" . $this->db->escape($data['filter_cfs']) . "%'";
			}
			if (isset($data['filter_week']) && !is_null($data['filter_week'])) {
				$implode[] = "LDWeek LIKE '%" . $this->db->escape($data['filter_week']) . "%'";
			}
			if (isset($data['filter_last']) && !is_null($data['filter_last'])) {
				$implode[] = "LDYear LIKE '%" . $this->db->escape($data['filter_last']) . "%'";
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
				$sql .= " ORDER BY LDYear ";
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