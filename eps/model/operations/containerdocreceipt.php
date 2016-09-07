<?php

/**
 * @author Ben Towner
 * @name Line Booking - model - Operations
 * @version 0.1
 * @package lclapp - Web application
 * @link http://www.TroyContainerLine.com
 */
class ModelOperationsLinebooking extends Model {

				
		public function getVessels_detail($rotation,$sequence) {
						
			$query = $this->db->query("select * from troy_vessels as vessels inner join troy_vrotn as rotation on vessels.vesref = rotation.vrref
						where vessels.vesref = '" . $rotation . "' and  vessels.vesseq = '" . $sequence . "' ");
						
			return $query->row;
		}
				
		public function getVessels($data) {
			$sql = "select * from troy_vessels as vessels inner join troy_vrotn as rotation on vessels.vesref = rotation.vrref
		 ";

			$implode = array();
			$sql .= " where vessels.vesname not like '~%'"; 
			
			if (isset($data['filter_name']) && !is_null($data['filter_name'])) {
				$implode[] = "vesname LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
			}
			if (isset($data['filter_voyage']) && !is_null($data['filter_voyage'])) {
				$implode[] = "vesvoyg LIKE '%" . $this->db->escape($data['filter_voyage']) . "%'";
			}
			if (isset($data['filter_rotation']) && !is_null($data['filter_rotation'])) {
				$implode[] = "vrname LIKE '%" . $this->db->escape($data['filter_rotation']) . "%'";
			}
			if (isset($data['filter_load']) && !is_null($data['filter_load'])) {
				$implode[] = "vrload LIKE '%" . $this->db->escape($data['filter_load']) . "%'";
			}
			if (isset($data['filter_unload']) && !is_null($data['filter_unload'])) {
				$implode[] = "vrunlo LIKE '%" . $this->db->escape($data['filter_unload']) . "%'";
			}
			if (isset($data['filter_sail']) && !is_null($data['filter_sail'])) {
				$implode[] = "vesactualetd LIKE '%" . $this->db->escape($data['filter_sail']) . "%'";
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
				$sql .= " ORDER BY vesname ";
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


		public function getCarrierName($data) {
		
			$query = $this->db->query("select LineSCAC as carrier from troy_lineads where linecode = '" . $data . "' ");
		
			return $query->row['carrier'];
		}

		public function getCutOffs($data){
			
			$query = $this->db->query("Select distinct lttorig,lttload,lttunlo,lttcut,ltttim,lttoday from LCL_TT where lttrot='" . $data . "' order by lttorig asc");
			
			
			return $query->rows;
		
		}
	}
	?>